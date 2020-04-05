class BookDetailsController < ApplicationController
  layout "homepage"
  before_action :set_book_detail, only: [:show,:destroy]
  def new
    @book_detail = BookDetail.new
  end
  def create 
    @book_detail = BookDetail.new(book_detail_params)
    if UserBook.exists?(user:current_user , book_detail: get_book(params[:book_detail][:name]))
      flash.now[:warning] = "alerady exist"
      render 'new' and return
    else
      url = "https://www.google.com/search?q=#{params[:book_detail][:name]} book"
      response = BookDetailsSpider.process(url)
      if response[:status] == :completed && response[:error].nil?
        @author = BookDetailsSpider.get_author
        if(@author.id.nil?)
          @book_detail.author_id = Author.find_by(name:@author.name).id
        else
          @book_detail.author_id = @author.id
        end
        @book_detail.category_id = BookDetailsSpider.get_category_id
     
        if @book_detail.save
          UserBook.create(user_id:current_user.id , book_detail_id:@book_detail.id , quantity:params[:book_detail][:quantity])
          flash.now[:success] = "One book added to your site."
          render 'new' # change
        else
          flash.now[:danger] = "Please fix the issue inorder to add book."
          render 'new'
        end
      end
    end
    rescue StandardError => e
    render plain: "Error: #{e}"
  end

  def show
  end

  private
  def book_detail_params
    params.require(:book_detail).permit(:name, :price , :review_of_owner , :page_count , images:[])
  end

  def get_book(bookname)
    BookDetail.find_by(name:bookname.downcase.strip)
  end

  def set_book_detail
    @book_detail = BookDetail.find(params[:id])
  end

end
