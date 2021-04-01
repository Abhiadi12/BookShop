class PaymentController < ApplicationController
  layout "homepage"
  before_action :authenticate_user!

  #for validate the registration
  def create
    session[:phone_number] = params[:phone_number]
    session[:country_code] = params[:country_code]
    @response = Authy::PhoneVerification.start(
      via: params[:method],
      country_code: params[:country_code],
      phone_number: params[:phone_number]
    )
    if @response.ok?
      redirect_to challenge_path
    else
      redirect_to cart_index_path , alert: "Invalid country-code or phone number"
    end
  end
  #check the otp and proceed
  def verify
    @response = Authy::PhoneVerification.check(
      verification_code: params[:code],
      country_code: session[:country_code],
      phone_number: session[:phone_number]
    )
    if @response.ok?
      session[:phone_number] = nil
      session[:country_code] = nil
      ChangeDbDuringPurchaseJob.perform_now(current_user) # transfer all items to the payment process
      PurchaseNotifyJob.set(wait:10.minutes).perform_later(current_user) # after x minutes send notification to the owner of the book
      redirect_to root_path , notice: "we will contact you with in 10 mins"
    else
      render :challenge
    end
  end

  def orders
    @orders = Payment.where(user_id:current_user.id , status:false)
  end

  def destroy
    @item = Payment.find(params[:id])
    unless @item.nil?
      authorize @item
      @item.destroy # remove from status false payemnt table
    end
    redirect_back fallback_location: root_path
  end

  def history
    @payment_histories = Payment.where(user_id:current_user.id , status:true)
  end
end