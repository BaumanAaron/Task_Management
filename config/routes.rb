Rails.application.routes.draw do
  resources :task_manager_apps
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
root 'application#hello'
  # Defines the root path route ("/")
  # root "articles#index"
  get '/tasks_within_date_range', to: 'task_manager_apps#tasks_within_date_range', as: 'tasks_within_date_range'
end
