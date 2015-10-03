require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"	
  get 'profile', to:'users#show'
  get 'like',to:'comments#like'
  get 'dislike',to:'comments#dislike'
  get 'confirm', to:'after_signup#confirm'
  get 'vacancies', to:'vacancies#index'
  get 'share_policy',to:'company#share_policy'
  get 'about_us',to: "company#about_us"
  resources :inquiries
  get 'invest', to: "inquiries#invest"
  get 'ourjobs',to: "inquiries#ourjobs"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'job_search', to: "search#job_search"
  get 'search/search', as: :search
  
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :sessions => "users/sessions",:confirmations => "users/confirmations" ,:registrations => "registrations" } #新建registrations controller,为了能够注册后重定向到after_signup_path
  scope '(:locale)' do #:locale是插入语，放在path前面，代表了地址里面出现的:locale参数如(en,cn等),
    get 'mobile_show_job', to:'jobs#show_job_on_mobile'
    get 'mobile_show_company', to: 'jobs#show_company_on_mobile'
    get 'my_savings', to:'home#my_savings'
    get 'my_apply', to:'home#my_apply'
    get 'job_invites', to:'home#job_invites'
    get 'edit_sub', to:'jobs#edit_sub'
    get 'edit_bosses', to:'jobs#edit_bosses'
    get 'my_pending_jobs',to:'home#my_pending_jobs'
    get 'my_closed_jobs',to:'home#my_closed_jobs'
    patch 'job_close',to:'home#close_job'
    patch 'job_pending',to:'home#pending_job'
    post 'invite',to: 'invitations#create'
    
    patch 'reject_invite', to:'invitations#reject'
    patch 'accept_invite', to:'invitations#accept'
    patch 'accept_interview', to:'interviews#accept'
    patch 'reject_interview', to:'interviews#reject'
    get 'my_interviews', to:'home#my_interviews'
    get 'my_invites', to:'home#my_invites'
    get 'pending_invites',to:'home#pending_invites'
    get 'closed_invites',to:'home#closed_invites'
    get 'my_line_items',to:'home#my_line_items'
    get 'my_referals',to:'home#my_referals'
    get 'my_talents',to:'home#my_talents'
    get 'my_jobs',to:'home#my_jobs'
    
    # 一个奇怪的问题, post的话会找不到路径,而且会和添加备注的submit冲突
    patch 'email_multiple', to:'home#email_multiple'
    post 'send_email', to:'home#send_email'
    
    get 'users/:id/refer', to:'users#refer', as: :user_refer # 简历上点击推荐按钮
    
    devise_scope :user do
      get "sign_out", to: "devise/sessions#destroy"
      get "sign_in", to: "devise/sessions#new"
      get "sign_up", to: "registrations#new"
      end
    root 'front#show'

    resources :clients do 
      resources :hrs
    end
    # link的话没有render的必要
    get 'bd_email',to:'clients#send_email'
    get 'bd_test',to:'clients#bd_test'
    delete 'delete_hr', to:'clients#delete_hr'

    get 'users/:id/blog_home',to:'microposts#home', as: :blog_home
    resources :microposts
    resources :relationships, only: [:create, :destroy]

    patch 'reject' => 'line_items#reject', as: :job_reject
    resources :jobs do
      member do
	post :save
	end
      post 'refer',to: 'line_items#refer'
      resources :bosses,only:[:update]
      resources :subordinates,only:[:update]
      get 'apply' => :apply
      patch 'accept' => 'line_items#accept', as: :accept
      
      resources :comments,except:[:edit,:show]
      resources :line_items do
	post 'refer',to: 'line_items#refer'
      end
      resources :build, controller: 'jobs/build'
    end
    resources :after_signup
    
    resources :users do
      resources :interviews,only:[:new,:show,:create,:update,:edit]
      member do
	 post :send_resume
         get :following, :followers
       end
      get "editsalary", to: "users#editsalary"
      resources :summaries,only:[:update,:edit]
      resources :educations,only:[:update,:edit]
      resources :works,only:[:update,:edit]
      resources :reviews,except:[:show] do #因为需要params[:user_id],所以把路径包含resources :users
        member { post :rating }
	get 'reviews/edit' => :edit
      end
    end
  end # end scope '(:locale)'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
