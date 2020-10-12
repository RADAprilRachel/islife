class PagesController < ApplicationController

  http_basic_authenticate_with name: "lexi", password:"gonnaneedbettersecurity", except: [:show]

  def index
    @pages = Page.all.order(:date)
  end

  def show
    @page = Page.find(params[:id])
    @first = Page.order(:date).first()
    @previous = Page.where(["date < ?", @page.date]).order(date: :desc).first()
    @next = Page.where(["date > ?", @page.date]).order(:date).first()
    @last = Page.order(date: :desc).first()
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
    else
      render 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_path
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:attachment_id])
    @image.purge
    redirect_to edit_page_path(params[:page_id])
  end

  private
    def page_params
      params.require(:page).permit(:title, :date, :updated_at, images: [])
    end
end
