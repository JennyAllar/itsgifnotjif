class WelcomeController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @gif = Gif.new
    @gif.url = params[:gif][:url]
    @gif.name = params[:gif][:name]
    @gif.keyword_1 = params[:gif][:keyword_1]
    @gif.keyword_2 = params[:gif][:keyword_2]
    @gif.keyword_3 = params[:gif][:keyword_3]
    @gif.save
    redirect_to '/welcome'
  end
end