Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => redirect('/cars/new')
  resources :users do
    member do
      put 'update_password'
      get 'change_password'
    end
  end

  resources :cars do
    post 'print'
    get 'show_history'
    get 'show_invoice'
    resources :car_histories do
      member do
        post 'new'
        get 'show_print'
      end
    end
    member do
      post 'add_more_detail'
    end
  end
  get 'spare_parts/autocomplete_spare_part_name'
  post 'spare_parts/quick_create'
  resources :spare_parts do
    collection { post :import }
    collection do
      get 'import_page'
      get 'download'
    end
  end
  resources :spare_part_types
  resources :car_histories do
    member do
      post 'print'
      get 'show_print'
    end
  end
  resources :car_repairing_quotes
  resources :alerts
  resources :historical_reports do 
    member do
      get 'quote'
    end
  end

  resources :reports

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
