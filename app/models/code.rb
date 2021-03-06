# frozen_string_literal: true

class Code < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_one_attached :image

  before_validation :set_default_title

  validates :body, presence: true
  validates :title, presence: true

  paginates_per 5

  def self.default_title
    'Untitled'
  end

  def attach_blob(image_data_url)
    image_blob = ImageBlob.new(image_data_url)
    image.attach(
      io: image_blob.to_io,
      filename: Time.zone.now,
      content_type: image_blob.mime_type
    )
  end

  private

  def set_default_title
    self.title = Code.default_title if title.blank?
  end
end
