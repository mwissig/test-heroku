Rails.application.routes.draw do
  root 'pages#home'

  get 'register' => 'users#new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'

  resources :companies do
    resources :departments
    resources :employees
  end

  resources :users
  resources :articles

  get 'new-company' => 'companies#new'
  get 'mycompanies' => 'companies#index'
  get 'companies/new'
  get 'companies/edit'
  get 'companies/show'

  get 'employees/new'
  get 'employees/edit'
  get 'employees/index'
  get 'employees/show'
  get 'departments/new'
  get 'departments/edit'
  get 'departments/show'
  get 'departments/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/write' => 'articles#new'
  get 'articles/edit'
  get 'articles/show'
  get 'articles/index'
  get '/search' => 'articles#search'
  get '/results' => 'articles#results'
  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
