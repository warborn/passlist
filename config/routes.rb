Rails.application.routes.draw do
  resources :groups, except: [:new, :edit] do
    resources :classdays, except: [:show, :new, :edit]
  end

  patch "classes/:id/activate", to: "course_classes#active"
end
