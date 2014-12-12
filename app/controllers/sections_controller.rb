class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @sections = @chapter.sections.all
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new    
    respond_with(@section.chapter)
  end

  def edit
  end

  def create
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new(section_params)
    if @section.save
      respond_with(@chapter.book)
    else
      respond_with(@chapter, @section)
    end
  end

  def update
    if @section.update(section_params)
      respond_with(@chapter.book)
    else
      respond_with(@chapter, @section)
    end
  end

  def destroy
    @section.destroy
    respond_with(@section)
  end

  private
    def set_section
      @book = Book.find(params[:book_id])
      @chapter = Chapter.find(params[:chapter_id])
      @section = @chapter.sections.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:name, :description, :chapter_id)
    end
end
