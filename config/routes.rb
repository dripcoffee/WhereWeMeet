Rails.application.routes.draw do

  root 'index#index'
  get 'about' => 'index#about'
  get 'terms' => 'index#terms'
  get 'help' => 'index#help'
  
  get 'activity' => 'activity#list'
  get 'activity/new' => 'activity#new'
  post 'activity/add' => 'activity#add'
  post 'activity/checkin' => 'activity#checkin'
  get 'activity/user/:name' => 'activity#get_by_user'
  get 'activity/:id' => 'activity#get_by_id'

  get 'user/new' => 'user#new'
  get 'user/callback' => 'user#callback'
  get 'user/info' => 'user#info'
  get 'user/signout' => 'user#signout'

  get 'group' => 'group#list'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
