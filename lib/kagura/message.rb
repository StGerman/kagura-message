# frozen_string_literal: true

require 'kagura/message_validator'
require 'active_support/core_ext'

module Kagura
  class Message
    delegate :[], :merge, :as_json, :to_h, to: :@params

    def initialize(params, validator: MessageValidator.new)
      @params = convert_hash_keys(params.as_json)
                .merge(created_at: Time.zone.now)
                .with_indifferent_access
                .freeze

      @validator = validator
    end

    # rubocop:disable Metrics/AbcSize
    def to_raw
      Mail::Message.new do |m|
        m.from    = @params[:from]

        m.to      = @params[:to]
        m.cc      = @params[:cc]
        m.bcc     = @params[:bcc]

        m.subject = @params[:subject]
        m.date    = @params[:date]

        m.html_part { |part| part.body @params[:html_body] }
        m.text_part { |part| part.body @params[:text_body] }

        @params['attachments']&.each { |at| m.attachments[at['name']] = Base64.decode64(at['content']) }
      end.to_s
    end
    # rubocop:enable Metrics/AbcSize

    def validate
      @validator.call(@params)
    end

    private

    def convert_hash_keys(value)
      case value
      when Array
        value.map { |v| convert_hash_keys(v) }
      when Hash
        Hash[value.map { |k, v| [k.to_s.underscore, convert_hash_keys(v)] }].with_indifferent_access.freeze
      else
        value.freeze
      end
    end
  end
end
