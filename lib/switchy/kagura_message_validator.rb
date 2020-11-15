# frozen_string_literal: true

require 'dry-validation'

module Switchy
  class KaguraMessageValidator < Dry::Validation::Contract
    params do
      # Requred fields
      required(:to)
      required(:from)
      required(:subject)
      required(:text)
      required(:html)
      required(:attachments)

      optional(:cc)
      optional(:bcc)
      optional(:body)
      optional(:raw_text)
      optional(:raw_body)
      optional(:raw_html)
      optional(:headers)
      optional(:raw_headers)
      optional(:text).filled(:string)
      optional(:html).filled(:string)
      optional(:attachments).maybe(:array)
      optional(:spam_score)
      optional(:spam_report)
      optional(:charsets)
    end
  end
end
