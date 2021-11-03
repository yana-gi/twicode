# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    uid { 'MyString' }
    twitter_id { 'MyString' }
    twitter_name { 'MyString' }
    twitter_icon { 'MyString' }
  end
end
