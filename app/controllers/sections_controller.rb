class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  respond_to :html

  def index
    @book = current_user.books.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @sections = @chapter.sections.order(id: :desc)
    respond_with(@sections)
  end

  def show
    respond_with(@section)
  end

  def new
    @book = current_user.books.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new    
    respond_with(@section.chapter)
  end

  def edit
  end

  def create
    @book = current_user.books.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @section = @chapter.sections.new(section_params)
    
    if @section.save
      respond_with(@book, @chapter, @section)
    else
      respond_with(@chapter, @section)
    end
  end

  def update
    if @section.update(section_params)
      respond_with(@book, @chapter, @section)
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
      @book = current_user.books.find(params[:book_id])
      @chapter = Chapter.find(params[:chapter_id])
      @section = @chapter.sections.find(params[:id])
    end

    def section_params
      params.require(:section).permit(:name, :description, :chapter_id, :tag_list)
    end
end
