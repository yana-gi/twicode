# frozen_string_literal: true

class Language < ApplicationRecord
  validates :name, uniqueness: true

  def self.name_list
    Language.all.map(&:name)
  end
end
