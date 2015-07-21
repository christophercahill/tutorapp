Rails.application.routes.draw do
  devise_for :users, only: [:new, :create]

  resources :users, only: [] do
    resources :profiles
  end

 get '/courses/search' => 'courses#search'


  resources :courses  

  resources :profiles do 
    resources :reviews 
  end 

  resources :schools do 
    resources :departments
  end 

  resources :departments do 
    resources :courses
  end 

  get '/looking_for', to: 'posts#looking_for'
  get '/offering', to: 'posts#offering'

  devise_for :users, :controllers => {registrations: 'devise/registrations'}


  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  root 'welcome#index'
end
