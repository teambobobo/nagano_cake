class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:genre] = "ジャンルを登録しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    flash[:genre] = "ジャンルを更新しました"
    redirect_to admin_genres_path
  end

  def destroy #テスト用実装（2/3）
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end #テスト用実装（2/3）

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
