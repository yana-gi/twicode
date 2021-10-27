# frozen_string_literal: true

class ImageBlob
  attr_reader :image_data_url

  def initialize(image_data_url)
    @image_data_url = image_data_url
  end

  def mime_type
    image_data_url[%r/(image\/[a-z]{3,4})/]
  end

  def to_io
    StringIO.new(decoded_content)
  end

  private

  def decoded_content
    Base64.decode64(content)
  end

  def content
    image_data_url.sub(%r/data:image\/.{3,},/, '')
  end
end
