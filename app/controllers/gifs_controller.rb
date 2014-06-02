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
    @gif = Gif.find(gif_params[:id])
  end

  def search
    @gifs = Gif.search params[:search]
  end

  def favorite
    type = params[:type]
    if type == "favorite"
      user = User.find(session[:user_id])
      gif = Gif.find(params[:id])
      gif_favorites = user.favorites
      if gif_favorites.include?(gif)
        "You've already favorited this!"
      else
        gif_favorites << gif

      end
      redirect_to :back, notice: 'You favorited #{gif.name}'

    elsif type == "unfavorite"
      user = User.find(session[:user_id])
      user.favorites.delete(params[:id])
      redirect_to :back, notice: 'Unfavorited #{gif.name}'
    else
      "unable to favorite"
    end

    @favorites = FavoriteGif.all
  end
  
  def random
    @gif = Gif.all.sample
  end

  private

  def gif_params
    params.require(:gif).permit(:url, :name, :keyword_1, :keyword_2, :keyword_3)
  end


end