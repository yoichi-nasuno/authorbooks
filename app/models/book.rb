class Book < ApplicationRecord

  validates :book_name, presence: true, length: { maximum: 50 }

  has_many :book_authors
  has_many :authors, through: :book_authors
end
