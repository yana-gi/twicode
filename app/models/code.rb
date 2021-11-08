# frozen_string_literal: true

class Code < ApplicationRecord
  has_one_attached :image

  enum language: {
    'PlainText': 0,
    'Bash': 1,
    'C': 2,
    'C#': 3,
    'C++': 4,
    'CSS': 5,
    'Diff': 6,
    'Go': 7,
    'HTML': 8,
    'XML': 9,
    'JSON': 10,
    'Java': 11,
    'JavaScript': 12,
    'Kotlin': 13,
    'Markdown': 14,
    'PHP': 15,
    'Perl': 16,
    'Python': 17,
    'R': 18,
    'Ruby': 19,
    'Rust': 20,
    'SCSS': 21,
    'SQL': 22,
    'Shell': 23,
    'Swift': 24,
    'TypeScript': 25,
    'YAML': 26
  }

  def attach_blob(image_data_url)
    image_blob = ImageBlob.new(image_data_url)
    image.attach(
      io: image_blob.to_io,
      filename: Time.zone.now,
      content_type: image_blob.mime_type
    )
  end
end
