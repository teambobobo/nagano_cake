class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "会員"
      @customers = Customer.looks(params[:search], params[:word]).page(params[:page]).per(10).order(:id)
    else
      @items = Item.looks(params[:search], params[:word]).where(is_sale: true).page(params[:page]).per(8).order(:id)
    end
  end

  def genre_search
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id).where(is_sale: true).page(params[:page]).per(8).order(:id)
  end
end

#ビュー（ジャンル検索部分）から送られてきたgenre_idを @genre_idに代入する
#ビュー（ジャンル検索部分）から送られてきたgenre_id`を持つ Itemを全て取得