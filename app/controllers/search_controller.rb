require 'will_paginate/array'
class SearchController < ApplicationController
  layout "homepage"
  before_action :authenticate_user!

  def custom
    @results = Category.exists?(name:params[:search].capitalize()) ? Category.find_by(name:params[:search].capitalize()).book_detail.paginate(page: params[:page],per_page:2) : @results = BookDetail.where(["name like ?" , "%#{params[:search]}%"]).paginate(page: params[:page],per_page:2)
    render 'index'
  end

  def specific_category
    @results = BookDetail.where(["category_id = ?" , params[:category_id]]).paginate(page: params[:page],per_page:2)
    render 'index'
  end

  def advance_search
    @authors = Author.all
    if( params[:author_name_tick].to_i == 1 && params[:price_tick].to_i == 1 )
      @results = UserBook.where(["price <= ?",params[:maxprice]]).filter{|object| object.book_detail.author.name == params[:name].downcase.strip}.paginate(page: params[:page],per_page:2) 
      render 'index' and return
    elsif(params[:author_name_tick].to_i == 1)
      @results = Author.find_by(name:params[:name].downcase.strip)
      @results = @results.book_details.paginate(page: params[:page],per_page:2) if @results
      render 'index' and return
    elsif(params[:price_tick].to_i == 1)
      @results = UserBook.where(["price <= ?",params[:maxprice]]).paginate(page: params[:page],per_page:2) 
      render 'index' and return
    end
    # render 'index' individually because from advance_search view the request then comes to again advance_search option based on the checkbox
  end

end
