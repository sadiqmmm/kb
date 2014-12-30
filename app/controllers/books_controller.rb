class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    if params[:tag]      
      @books = current_user.books.tagged_with(params[:tag]).order(created_at: :desc)
      respond_with(@books)
    else
      @books = current_user.books.order(created_at: :desc)
      respond_with(@books)
    end
  end

  def show
    respond_with(@book)
  end

  def new
    @book = current_user.books.build
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = current_user.books.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :description, :tag_list)
    end
end
