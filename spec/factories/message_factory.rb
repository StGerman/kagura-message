# frozen_string_literal: true

FactoryBot.define do
  factory :message, class: 'Message' do
    to { build_list(:contact, 1) }
    cc { [] }
    from { build(:contact) }
    subject { 'email subject' }

    attachments { [] }
    text { 'Hello!' }
    html { '<h1> Hello World!</h1>' }
    trait :with_attachment do
      attachments do
        [ActionDispatch::Http::UploadedFile.new(
          {
            filename: 'img.png',
            type: 'image/png',
            tempfile: File.new("#{__dir__}/../../public/favicon.ico")
          }
        )]
      end
    end
    initialize_with { new(attributes) }
  end
end
