class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @book = Book.find(params[:book_id])
    @chapters = @book.chapters.all
    respond_with(@chapters)
  end

  def show
    respond_with(@chapter)
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.new
    respond_with(@chapter.book)
  end

  def edit    
  end

  def create
    @book = Book.find(params[:book_id])
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
      @book = Book.find(params[:book_id])
      @chapter = @book.chapters.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:name, :description, :book_id)
    end
end
