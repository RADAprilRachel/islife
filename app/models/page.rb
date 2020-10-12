class Page < ApplicationRecord
  validates :date, presence: true
  has_many_attached :images
end
