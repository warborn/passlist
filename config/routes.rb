Rails.application.routes.draw do
  resources :groups, except: [:new, :edit] do
    resources :classdays, except: [:show, :new, :edit]
  end

  patch "classes/:id/activate", to: "course_classes#active"
  get "classes/:id", to: "course_classes#show"
  post "classes/:id/generate", to: "course_classes#generate"

  post "groups/:group_id/students", to: "students#create"
  patch "classes/:course_class_id/students/:id/assist", to: "students#assist"
end
