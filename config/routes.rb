Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Read
  get 'tasks', to: 'tasks#index' # Read (all)

  # Create
  get 'tasks/new', to: 'tasks#new', as: :new_task # GET the form : The `new` route needs to be *before* `show` route.
  post 'tasks', to: 'tasks#create' # POST the form

  get 'tasks/:id', to: 'tasks#show', as: :task # Read (one)

  # Update
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch 'tasks/:id', to: 'tasks#update'

  # Delete
  delete 'tasks/:id', to: 'tasks#destroy'

  resources :tasks

end
