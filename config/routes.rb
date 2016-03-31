Rails.application.routes.draw do
  resources :groups, except: [:new, :edit] do
    resources :classdays, except: [:show, :new, :edit]
  end
end
