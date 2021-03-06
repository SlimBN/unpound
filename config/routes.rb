Unbound::Application.routes.draw do

scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    # resources :articles
    # root to: 'homes#index'


  resources :folders


  match 'admin/blogs' => 'administrations#blogs', :as => :admin_blogs
  match 'admin/articles' => 'administrations#articles', :as => :admin_articles
  match 'admin/users' => 'administrations#users', :as => :admin_users
  match 'admin/publications' => 'administrations#publications', :as => :admin_publications

  match '', to: "blogs#index", constraints: {subdomain: 'blog'}

  #resources :administrations

  #user favoritism
  match 'article/favorite/toggle/:id' => 'favorites#article_favorite_toggle', :as => :article_favorite_toggle

  #User follow from article
  match 'article/user/follow/:id' => 'follows#article_user_follow', :as => :article_user_follow
  match 'article/user/unfollow/:id' => 'follows#article_user_unfollow', :as => :article_user_unfollow


  resources :blogs


  root :to => 'homes#index'


  resources :visits


  match 'soons/watch' => 'soons#watch', :as => :watch_newsletter
  resources :soons


  resources :favorites


  resources :publications


  resources :tags


  resources :credits


# Manipulation de Journaux
  # match 'journals/abonnements' => 'journals#abonnements', :as => :abonnements
  # match 'journal/issue/:id' => 'issues#show', :as => :numero

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



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'products/:id' => 'catalog#view'


  match 'journals/add_journal' => 'journals#add_journal', :as => :add_journal

  match 'authors' => 'users#index'
  match 'author/:id' => 'users#show'


  # match ':id' => 'journals#show', :as => :see_journal
  match 'vote/article' => 'credits#issue_vote', :as => :vote_article
  match 'vote/user/article' => 'credits#user_article_vote', :as => :vote_user_article


  match 'article/vote/up/:id' => 'credits#article_vote_up', :as => :article_vote_up
  match 'article/vote/down/:id' => 'credits#article_vote_down', :as => :article_vote_down



  #tabs gestion
  match 'home/articles' => 'homes#home_tab_articles', :as => :home_tab_articles
  match 'home/journals' => 'homes#home_tab_journals', :as => :home_tab_journals

  #match '*path', to: redirect {|params| "/#{I18n.default_locale}/#{CGI::unescape(params[:path])}" }
  # match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  match '*path', to: redirect {|params| "/#{I18n.default_locale}/#{params[:path]}"}, constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
end

  #match '', to: redirect("/#{I18n.default_locale}/")
  match '', to: redirect("/#{I18n.default_locale}")

get "/404", :to => "errors#not_found"
get "/422", :to => "errors#unacceptable"
get "/500", :to => "errors#internal_error"


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
