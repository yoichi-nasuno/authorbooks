class BooksController < ApplicationController
  def create
    # @book = book.find_by(book_name: :param[:book_author])
    
    # book の保存
    @book = Book.new
    # params == { "book" => { "book_name" => "xxx", "author_name" => "yyyy" } }
    @book.book_name = params[:book][:book_name]
    if @book.save
      flash[:success] = '本が登録されました'
    else
      flash[:danger] = '本が登録されませんでした'
    end 

    # author の保存
    @author = Author.new
    @author.author_name = params[:book][:author_name]
    if @author.save
      flash[:success] = '著者が登録されました'
    else
      flash[:danger] = '著者が登録されませんでした'
    end 
    
    # 中間テーブルの保存
    # book_authorsテーブル: id, book_id, author_id
    @book_author = @book.book_authors.find_or_create_by(author_id: @author.id)
    redirect_to @book
    # if @book_author.save
    #   flash[:success] = '登録されました'
    #   redirect_to @book
    # else
    #   flash.now[:danger] = '登録されませんでした'
    #   @books = Book.all
    #   @authors = Author.all
    #   render :index
    # end 
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
