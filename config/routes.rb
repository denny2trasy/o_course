ElCourse::Application.routes.draw do
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

  resources :customers do
    member do
      post "set_customer_company_name"
      post "set_customer_short_name"
    end
  end
  resources :course_packages do 
    member do
      post "set_item_position"
      post "set_course_package_name"
      post "set_course_package_valid_for"
      post "set_course_package_description"
      post "set_course_package_eleutian_course"
      post "set_course_package_thinkingcap_program"
      post "set_register_code_desc"
      post "set_course_package_customer_id"
      post "set_scenario_name"
      post "set_scenario_position"
      post "set_scenario_show_scenario_id"
      post "set_third_content_name"
      post "set_third_content_position"
      post "set_third_content_show_content_id"
      post "set_third_content_show_link"
      post "set_third_content_thinkingcap_course"
      post "set_item_group_position"
      post "set_item_group_name"
      post "set_item_group_course_type"
      post "set_item_group_quiz_level"
      post "set_course_package_course_type"
      get  "copy"
    end
  end
  resources :session_credits
  resources :items
  # resources :lessons
  
  resources :item_groups do
    #resources :lessons
    
    resources :courses, :only => [:index, :show] do
      resources :units, :only => [:show]
    end
  end
  
  resources :register_codes do
    collection do
      post "active"
    end
  end
  resources :scenarios do
    member do 
      post "set_scenario_name"
      post "set_scenario_show_scenario_id"
      post "set_scenario_image_url"
    end
  end
  resources :third_contents
  resources :thinkingcaps do
    member do 
      post "set_thinkingcap_name"
      post "set_thinkingcap_show_course_id"
      post "set_thinkingcap_image_url"
    end
  end
  resources :chinacaches do
    member do 
      post "set_chinacache_name"
      post "set_chinacache_show_chinacache_id"
      post "set_chinacache_image_url"
    end
  end
   

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
  root :to => "customers#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
