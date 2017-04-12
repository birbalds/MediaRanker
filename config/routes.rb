Rails.application.routes.draw do
    root 'home#index', as: 'home'

    resources :users, only: [:new, :show, :index, :create]
    resources :works
    resources :votes, only: [:new, :create]

    get '/albums', to: 'works#index', as: :albums
    get '/books', to: 'works#index', as: :books
    get '/movies', to: 'works#index', as: :movies

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    post 'works/:id/upvote', to: 'users#upvote', as: 'upvote'
end
