Rails.application.routes.draw do
  get 'homepage' => "homepage#home"
  devise_for :users, controllers: {
    sessions: 'users/sessions' , passwords:'users/passwords', registrations: 'users/registrations' , confirmations: 'users/confirmations' , omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  devise_scope :user do
    root 'users/sessions#new'
  end
  resources:user_books , except: [:edit , :update , :index]
  # config/routes.rb
  get 'likes/:id' => "user_books#like" , as:"like"
  get 'dislikes/:id' => "user_books#dislike" , as:"dislike"
  get 'profile' => "homepage#profile"
  get 'notifications' => "homepage#notification"
  get 'allnotifications' => "homepage#all_notification"
  delete 'notification/:id' => "homepage#destroy" , as:"delete_notification"
  get 'custom_search' => "search#custom"
  get 'search_by_only_category' => "search#specific_category"
  get 'advance_search' => 'search#advance_search'
  resources:cart , only: [:index , :show ,:destroy]
  get 'add_to_cart' => "cart#add"
  #for payment
  post 'payment_auth' => "payment#create"
  get 'challenge' => "payment#challenge"
  post 'verify' => "payment#verify"
  get 'payment_history' => "payment#history"
  get 'your_orders' => "payment#orders"
  delete 'discard/:id' => "payment#destroy" , as:"remove_item"

  get "admin/index" => "admin#index"
  post "send" => "admin#message_send"
  get "details" => "admin#details"
  get "notify" => "homepage#notify"
  mount ActionCable.server, at: '/cable' #for action cable
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  match '*path', to: "application#render_404", via: :all, constraints: lambda {|req| req.path.exclude? 'rails/active_storage'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
