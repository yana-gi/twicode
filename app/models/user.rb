# frozen_string_literal: true

class User < ApplicationRecord
  has_many :code, dependent: :destroy

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    twitter_id = auth_hash[:info][:nickname]
    twitter_name = auth_hash[:info][:name]
    twitter_icon = auth_hash[:info][:image]

    find_or_create_by(uid: uid) do |user|
      user.uid = uid
      user.twitter_id = twitter_id
      user.twitter_name = twitter_name
      user.twitter_icon = twitter_icon
    end
  end
end
