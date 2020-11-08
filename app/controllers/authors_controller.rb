class AuthorsController < ApplicationController
  def index
    @authors = Author.new
  end 
    
  def show
    @author = Author.find(params[:id])
  end

  def new
  end 
  
  def create
  end 
end
