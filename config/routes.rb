Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'api/v1/sessions'
  }
  namespace :api do
    namespace :v1 do
      get '/member-data', to: 'members#show'
      resources :error_reports
      resources :skript_reports
      resources :video_reports
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
