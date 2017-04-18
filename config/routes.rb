Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users

  resources :teachers do
    collection do
      get :search
    end
  end

  resources :tutorings, only: [:new, :create]
  resources :users, only: [:show]
  resources :admins, only: [:index, :show]
  resources :experiences, except: [:index, :show]
  resources :services, except: [:index, :show]
  resources :tests, except: [:index]
  resources :reviews, except: [:index]

  get 'landing', to: 'teachers#landing', as: 'teachers_landing'
end
