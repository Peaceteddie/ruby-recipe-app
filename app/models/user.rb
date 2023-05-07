class User < ApplicationRecord
  has_many :recipes, through: :recipelist
end
