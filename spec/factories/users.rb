# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    uid { '123456' }
    twitter_id { 'Mock User' }
    twitter_name { 'Mock User Name' }
    twitter_icon { 'http://mock_image_url.com' }
  end
end
