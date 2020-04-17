class UserBooksController < ApplicationController
  layout "homepage"
  before_action :set_user_book_detail, only: [:show,:destroy,:like,:dislike]
  def new
    @user_book = UserBook.new
  end

  def create 
    @user_book = UserBook.new(user_book_params)
    if UserBook.exists?(user:current_user , book_detail: get_book(params[:user_book][:name]))
      flash.now[:warning] = "alerady exist"
      render 'new' and return #user try to enter the same book
    else
      @book = get_book(params[:user_book][:name])
      if @book #book exist but the userbook not
        @user_book.book_detail = @book
        @user_book.user = current_user
        redirect_to profile_path if @user_book.save 
      else # book not exist in db , have to scrapp
        url = "https://www.google.com/search?q=#{params[:user_book][:name]} book"
        response = UserBooksSpider.process(url)
        if response[:status] == :completed && response[:error].nil?
          @author =  UserBooksSpider.get_author #"either existed or new"
          @book_detail = BookDetail.new(name:params[:user_book][:name] , author_id: @author.id , category_id:  UserBooksSpider.get_category_id)
          #save the value for the book object
          @book_detail.save
          @user_book.user = current_user
          @user_book.book_detail = @book_detail
          #@user_book.name = params[:user_book][:name]
          if @user_book.save
            flash[:success] = "One book added to your site."
            redirect_to profile_path
          else
            flash.now[:danger] = "Please fix the issue inorder to add book."
            render 'new' and return
          end
        end
      end
    end
    rescue StandardError => e
    render plain: "Error: #{e}."
  end

  def show
  end

  def destroy
    @user_book.images.each do|image|
      image.purge
    end # delete all attached images
    @user_book.destroy
    redirect_to  homepage_home_path
  end

  def like
    status = @user_book.voted_up_by? current_user
    @user_book.liked_by current_user if !status 
    @user_book.unliked_by current_user if status
    @rating = rating_calculator(@user_book.votes_for.size ,  @user_book.get_likes.size)
    @user_book.rating = @rating
    @user_book.update(rating:@rating)
    respond_to do |format|
      format.html { redirect_to @user_book , notice:"upvoted"}
      format.js { render 'rating'}
    end 
  end

  def dislike
    status = @user_book.voted_down_by? current_user
    @user_book.disliked_by current_user if !status 
    @user_book.undisliked_by current_user if status
    @rating = rating_calculator(@user_book.votes_for.size ,  @user_book.get_likes.size)
    @user_book.update(rating:@rating)
    respond_to do |format|
      format.html { redirect_to @user_book , notice:"upvoted"}
      format.js { render 'rating'}
    end 
  end

  private
  def user_book_params
    params.require(:user_book).permit(:price , :review , :page_count , images: [])
  end

  def get_book(bookname)
    BookDetail.find_by(name:bookname.downcase.strip)
  end

  def set_user_book_detail
    @user_book = UserBook.find(params[:id])
  end

  def rating_calculator(total , upvote)
    return 0 if upvote == 0
    rating = ((upvote.to_f / total.to_f) * 100).to_i
    case rating
    when 1..25
        1
    when 26..50
        2
    when 51..75
        3
    when 76..99
        4
    when 100
        5
    end
  end

end