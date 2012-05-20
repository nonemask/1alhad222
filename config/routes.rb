Oo::Application.routes.draw do

 resources :computers, :as => "sounds",:controller => "sounds" do
    resources :lists ,:controller => "albums"
 end
  resources :images,:as => "studionames" do
    resources :nums ,:as => "studios"
 end
 resources :hekoms
 resources :sessions, only: [:new, :create, :destroy]
resources :users do
  
    resources :microposts do
       get 'admin', :on => :collection
    end

end
  root to: 'pages#index'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  match '/signup', to: 'users#new'
   match '/aboutus', to: 'pages#aboutus'
   
   match '/services/9', to: 'pages#three3'
   match '/services/8', to: 'pages#three2'
  match '/services/7', to: 'pages#three1'
   match '/services/6', to: 'pages#two2'
   match '/services/5', to: 'pages#two1'
   match '/services/4', to: 'pages#one4'
   match '/services/3', to: 'pages#one3'
   match '/services/2', to: 'pages#one2'
   match '/services/1', to: 'pages#one1'
   match '/services', to: 'pages#services'
   
  match '*a', :to => 'pages#index'
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
