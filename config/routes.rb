Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
                                registrations:  'registrations',
                                sessions:       'sessions'
                              }

  resources :groups, except: [:new, :edit] do
    resources :classdays, except: [:show, :new, :edit]
  end

  patch "classes/:id/activate", to: "course_classes#active"
  get "classes/:id", to: "course_classes#show"

  post "groups/:group_id/students", to: "students#create"
  patch "classes/:course_class_id/students/:id/assist", to: "students#assist"
  post "groups/:group_id/students/import", to: "students#import"
end
