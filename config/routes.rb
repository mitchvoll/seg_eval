Rails.application.routes.draw do
    get 'algorithms/new'

    get 'datasets/new'  
    get 'sessions/new'
    root 'main_pages#home'
    get 'help' => 'main_pages#help'
    get 'about' => 'main_pages#about'
    get 'contact' => 'main_pages#contact'
    get 'signup' => 'users#new'
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :users
    resources :datasets
    resources :algorithms
end
