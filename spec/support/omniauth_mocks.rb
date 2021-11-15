# frozen_string_literal: true

module OmniauthMocks
  def mock_twitter!
    OmniAuth.config.mock_auth[:twitter] =
      OmniAuth::AuthHash.new({
                               'provider' => 'twitter',
                               'uid' => '123456',
                               'info' => {
                                 'nickname' => 'Mock User',
                                 'name' => 'Mock User Name',
                                 'image' => 'http://mock_image_url.com'
                               }
                             })
  end

  def mock_twitter_failure!
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
  end
end
