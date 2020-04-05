Rails.application.routes.draw do
  get 'homepage/home'
  devise_for :users, controllers: {
    sessions: 'users/sessions' , passwords:'users/passwords', registrations: 'users/registrations' , confirmations: 'users/confirmations' , omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  devise_scope :user do
    root 'users/sessions#new'
  end
  resources:book_details
  get 'profile' => "homepage#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
