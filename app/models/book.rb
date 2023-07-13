class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :book_image

  validates :title, presence: true
  validates :opinion, presence: true
end
