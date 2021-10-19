# frozen_string_literal: true

class Code < ApplicationRecord
  has_one_attached :image

  def attach_blob(image_data_url)
    image_blob = ImageBlob.new(image_data_url)
    image.attach(
      io: image_blob.to_io,
      filename: Time.zone.now,
      content_type: image_blob.mime_type
    )
  end
end
