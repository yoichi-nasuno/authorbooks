class BooksController < ApplicationController
  def create
    # @book = book.find_by(book_name: :param[:book_author])
    @book = Book.new
    @book.book_name = params[:book][:book_name]
    if @book.save
      flash[:success] = '本が登録されました'
    else
      flaxh[:danger] = '本が登録されませんでした'
    end 
    @author = Author.new
    @author.author_name = params[:book][:author_name]
    
    if @author.save
      flash[:success] = '著者が登録されました'
    else
      flash[:danger] = '著者が登録されませんでした'
    end 
    
    @book_author = @book.authors.build
    if @book_author.save
      flash[:success] = '登録されました'
      redirect_to @book
    else
      flash.now[:danger] = '登録されませんでした'
      render :index
    end 
  end
  
  def new
    @book = Book.new
  end 

  def index
    @book = Book.new
    @books = Book.all
    @authors = Author.all

  end 
  
  def show
    # @book = book.find_by(book_name: :param[:book_author])
    @book = Book.find(params[:id])
  end

end
