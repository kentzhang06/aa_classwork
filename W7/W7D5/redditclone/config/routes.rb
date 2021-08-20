Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do 
    resources :subs, only:[:index]
  end
  resource :session

  resources :subs, only:[:show, :new, :create, :edit, :update]
end
