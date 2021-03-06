Rails.application.routes.draw do
  get 'api/todotasks'

  get 'api/projecttasks'

  get 'page/index'

  # Todo Tasks
  get 'api/todotasks'
  post 'api/todotasks' => 'api#create_todotask'
  get 'api/todotasks/:id' => 'api#todotask'
  put 'api/todotasks/:id' => 'api#update_todotask'
  delete 'api/todotasks/:id' => 'api#delete_todotask'

  get 'api/todotasks_auth'
  get 'api/todotasks/:id' => 'api#todotask_auth'

  # Project Tasks
  
  get 'api/projecttasks'
  get 'api/projecttasks/:id' => 'api#projecttask'
  get 'api/projecttasks_auth'
  get 'api/projecttasks/:id' => 'api#projecttask_auth'


  resources :project_tasks
  resources :todo_tasks
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#index'



  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
