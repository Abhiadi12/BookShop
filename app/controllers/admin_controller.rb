class AdminController < ApplicationController
  layout "homepage"

  def index
    @id = params[:chat]
    if current_user.id == 2 # if admin 
      @users = User.where.not(id: current_user.id) #  consider only one admin for my project and its me
      #scope :all_except, ->(user) { where.not(id: user) }
      #@users = User.all_except(current_user)
      @messages = @id.nil? ? Message.where(chat_id:User.second.subscription.chat_id) : @messages = Message.where(chat_id:@id)
    else
      @messages = Message.where(chat_id:current_user.subscription.chat_id)
    end
    respond_to do |format|
      format.js { render 'demo' }
      format.html
    end
  end

  def message_send
    msg = Message.create(body:params[:message],user_id:current_user.id , chat_id:params[:chat_id])
    if current_user.id == 2
      ActionCable.server.broadcast "messages:#{msg.chat_id}" , html:msg_html(msg) 
    else 
      ActionCable.server.broadcast "messages:#{current_user.subscription.chat_id}" , html:msg_html(msg) 
    end
  end

  def details
    @users = User.all
  end
=begin  def check
    #render js: "alert('Hello Rails');"
    some_parameter = params[:some_parameter]
    @test=User.last
      format.json { 
      render json:@test
    }
    respond_to do |format| # whatever here send as respnse will be the result for the success function
      format.html { render 'demo' }
      format.json { render json:@test } 
    end
  end
=end
=begin def check
  @value = params[:chatid]
  render 'demo'
end
=end
  private

  def msg_html(message)
    render_to_string(partial: 'display', locals: {msg:message})
  end
end