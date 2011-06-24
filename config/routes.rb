BdlCapitalManagement::Application.routes.draw do
  devise_for :users

  resources :users

  resources :stocks

  resources :sectors

  resources :meetings_results

  resources :details

  resources :contacts

  resources :bdl_discussions
  
  match 'settings', :to => 'settings#index' , :method => :get  
  match 'settings/new_user', :to => 'settings#new_user' , :method => :post  
  match 'settings/:id/update_user', :to => 'settings#update_user', :method => :post 
  match 'settings/:id/destroy_user', :to => 'settings#destroy_user', :method => :post 
  match 'settings/search', :to => 'settings#search' , :method => :get  
  match '/up', :to => 'settings#up' , :method => :get  
  match '/uploadFile', :to => 'settings#uploadFile' , :method => :get 
  

  match 'stocks/:id/destroy', :to => 'stocks#destroy', :method => :post 
  match 'sectors/:id/destroy', :to => 'sectors#destroy', :method => :post 
  match 'meetings_results/:id/destroy', :to => 'meetings_results#destroy', :method => :post 
  match 'details/:id/destroy', :to => 'details#destroy', :method => :post 
  match 'contacts/:id/destroy', :to => 'contacts#destroy', :method => :post 
  match 'bdl_discussions/:id/destroy', :to => 'bdl_discussions#destroy', :method => :post 

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  root :to => "users#home_page"
  
end
