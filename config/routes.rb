Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions' , passwords:'users/passwords', registrations: 'users/registrations' , confirmations: 'users/confirmations'
  }
  devise_scope :user do
    root 'users/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
