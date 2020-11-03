class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
      t.index [:book_id, :author_id],unique: true
    end
  end
end
