JurisConsults::Application.routes.draw do
	match 'centro_custos/batch_destroy', :via => :delete
  resources :centro_custos


	match 'riscos/batch_destroy', :via => :delete
  resources :riscos


	match 'acompanhamentos/batch_destroy', :via => :delete
  resources :acompanhamentos


	match 'fases/batch_destroy', :via => :delete
  resources :fases


	paf_authorize 
	match 'conta_correntes/batch_destroy', :via => :delete
  resources :conta_correntes


	match 'contratos/batch_destroy', :via => :delete
  resources :contratos


	match 'forma_pagamentos/batch_destroy', :via => :delete
  resources :forma_pagamentos

	match 'tipo_pagamentos/batch_destroy', :via => :delete
  resources :tipo_pagamentos

	match 'tipo_lancamentos/batch_destroy', :via => :delete
  resources :tipo_lancamentos

	match 'advogados_escritorios/batch_destroy', :via => :delete
  resources :advogados_escritorios

	match 'escritorios/batch_destroy', :via => :delete
  resources :escritorios

	match 'assunto_processuals/batch_destroy', :via => :delete
  resources :assunto_processuals

	match 'andamentos/batch_destroy', :via => :delete
  resources :andamentos


	match 'processos/batch_destroy', :via => :delete
  resources :processos


	match 'tipo_andamentos/batch_destroy', :via => :delete
  resources :tipo_andamentos


	match 'tipo_processos/batch_destroy', :via => :delete
  resources :tipo_processos


	match 'locals/batch_destroy', :via => :delete
  resources :locals


	match 'clientes/batch_destroy', :via => :delete
  resources :clientes


	match 'situacaos/batch_destroy', :via => :delete
  resources :situacaos


	match 'reus/batch_destroy', :via => :delete
  resources :reus


	match 'advogados/batch_destroy', :via => :delete
  resources :advogados

  paf_scaffold :datatable, :versions, :import, :export

  match '/logout', :to => 'proteste/auth/user_sessions#destroy', as: :proteste_auth_logout

  match '/auth/failure', :to => 'proteste/auth/user_sessions#failure'

  match '/auth/:provider/callback', :to => 'proteste/auth/user_sessions#create'

  paf_scaffold :datatable, :versions, :import

  mount Ckeditor::Engine => '/ckeditor'

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
  root :to => 'advogados#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  paf_application :change_language, :catch_errors
end
