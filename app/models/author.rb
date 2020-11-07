class Author < ApplicationRecord
  
  validates :author_name, presence: true, length: { maximum: 50 }
  
  has_many :book_authors
  has_many :books, through: :book_authors
  
end
