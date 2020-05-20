class CartController < ApplicationController
  layout 'homepage'
  before_action :authenticate_user!
  def add
    Cart.create(user_id:current_user.id , user_book_id:params[:id].to_i)
    redirect_to  homepage_path , notice:"One item added to the cart"
  end

  def show
    redirect_to user_book_path(id:params[:id])
  end

  def index
    @cart_items = Cart.where(user_id:current_user.id)
  end

  def destroy
    @cart_item = Cart.find_by(user_id:current_user.id , user_book_id:params[:id])
    @cart_item.destroy if !@cart_item.nil?
    redirect_to  cart_index_path 
  end
end
