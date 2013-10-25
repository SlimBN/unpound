Unbound::Application.routes.draw do

  root :to => 'soons#index'


  resources :visits


  match 'soons/watch' => 'soons#watch', :as => :watch_newsletter
  resources :soons


  resources :publications


  resources :tags


  resources :credits


# Manipulation de Journaux
  match 'journals/abonnements' => 'journals#abonnements', :as => :abonnements
  match 'journal/issue/:id' => 'issues#show', :as => :numero

  resources :follows


  resources :notifications


  resources :reads


  resources :homes


  resources :articles_and_pages


  resources :pages


  resources :issues


  devise_for :users do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "register", :to => "devise/registrations#new"
  end

  resources :users


  resources :articles

  resources :journals

  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'


  match 'journals/add_journal' => 'journals#add_journal', :as => :add_journal

  match 'authors' => 'users#index'
  match 'author/:id' => 'users#show'


  match ':id' => 'journals#show', :as => :see_journal
  match 'vote/article' => 'credits#issue_vote', :as => :vote_article
  match 'vote/user/article' => 'credits#user_article_vote', :as => :vote_user_article



  #tabs gestion
  match 'home/articles' => 'homes#home_tab_articles', :as => :home_tab_articles
  match 'home/journals' => 'homes#home_tab_journals', :as => :home_tab_journals

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
  # root :to => 'homes#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
