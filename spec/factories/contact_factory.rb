# frozen_string_literal: true

FactoryBot.define do
  factory :kagura_contact, class: Hash do
    token { 'some.username' }
    host { 'email.com' }
    email { 'some.username@email.com' }
    full { 'Name of the User <from_user@email.com>' }
    name { 'Name of the User' }

    initialize_with { attributes }
  end
end
