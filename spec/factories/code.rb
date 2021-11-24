# frozen_string_literal: true

FactoryBot.define do
  factory :code do
    body { 'test' }
    language_id { 1 }
    user
    after(:build) do |code|
      code.attach_blob(image_data_url)
    end
  end
end

# code画像のdata_url。
# 本来の処理ではJS側でdata_urlを作成する
def image_data_url
  "data:image/png;base64,#{Base64.strict_encode64(File.open('spec/factories/test_code_image.png').read)}"
end
