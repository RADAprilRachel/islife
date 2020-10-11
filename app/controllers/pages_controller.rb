class PagesController < ApplicationController

  http_basic_authenticate_with name: "lexi", password:"gonnaneedbettersecurity", except: [:show]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
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

  private
    def page_params
      params.require(:page).permit(:title, :date)
    end
end
