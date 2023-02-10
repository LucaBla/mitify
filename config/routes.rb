Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :error_reports
      resources :skript_reports
      resources :video_reports
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
