Rails.application.routes.draw do
  devise_for :users
 root "trumps#index"
 resources :trumps
end
