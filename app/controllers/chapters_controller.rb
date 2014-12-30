class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  respond_to :html

  def index
    @book = current_user.books.find(params[:book_id])
    @chapters = @book.chapters.order(created_at: :desc)
    respond_with(@chapters)
  end

  def show
    respond_with(@chapter)
  end

  def new
    @book = current_user.books.find(params[:book_id])
    @chapter = @book.chapters.new
    respond_with(@chapter.book)
  end

  def edit    
  end

  def create
    @book = current_user.books.find(params[:book_id])
    @chapter = @book.chapters.new(chapter_params)    
    if @chapter.save    
      respond_with(@chapter.book)
    else
      respond_with(@book, @chapter)
    end  
  end

  def update
    if @chapter.update(chapter_params)
      respond_with(@chapter.book)
    else
      respond_with(@book, @chapter)
    end
  end

  def destroy
    @chapter.destroy
    respond_with(@chapter)
  end

  private
    def set_chapter
      @book = current_user.books.find(params[:book_id])
      @chapter = @book.chapters.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:name, :description, :book_id)
    end
end
