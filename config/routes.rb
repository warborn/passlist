Rails.application.routes.draw do
  resources :groups, except: [:new, :edit]
end
