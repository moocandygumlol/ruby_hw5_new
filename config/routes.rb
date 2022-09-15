Rails.application.routes.draw do
  get 'score/list'
  get 'score/edit'
  get 'score/delete'
  root 'main#home'
  get 'main/home'
  post 'main/test'
  get 'main/out'
  post 'score/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
