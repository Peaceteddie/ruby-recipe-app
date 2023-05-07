class Recipe < ApplicationRecord
  has_many :foods

  has_many :tags

  validates :name, presence: true, uniqueness: true
end
