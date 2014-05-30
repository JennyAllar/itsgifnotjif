class GifsController < ApplicationController
  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      session[:gif_id] = @gif.id
      redirect_to Gif
    else
      render :new
    end
  end

  def index
    if params[:search]
      @gifs = Gif.search(params[:search])
    else
      @gifs = Gif.all
    end
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def search
    @gifs = Gif.search params[:search]
  end

  private

  def gif_params
    params.require(:gif).permit(:url, :name, :keyword_1, :keyword_2, :keyword_3)
  end


end