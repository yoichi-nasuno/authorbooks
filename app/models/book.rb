class Book < ApplicationRecord

  validates :book_name, presence: true, length: { maximum: 50 }

  has_many :book_authors
  has_many :authors, through: :book_authors
  


  def relationships(othor_author)
    self.book_author.find_by(author_name: othor_author.author_name)
    self.book_authors.find_or_create_by(author_id: other_author.id)
  end 
end
