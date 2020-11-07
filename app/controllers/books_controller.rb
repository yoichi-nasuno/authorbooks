class BooksController < ApplicationController
  def create
    # @book = book.find_by(book_name: :param[:book_author])
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @authors = Author.all

  end 
  
   def show
    # @book = book.find_by(book_name: :param[:book_author])
    @book = Book.find(params[:id])
  end

end
