class GifsController < ApplicationController

  def index
    @gifs = Gif.all
  end

  def new
    @gifs = Gif.all
    @gif = Gif.new
  end

  def create
    Gif.create(gif_name: params[:gif][:gif_url, :gif_name, :keyword_1, :keyword_2, :keyword_3])
    redirect_to root_path
  end

end