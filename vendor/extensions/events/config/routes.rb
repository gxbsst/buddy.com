Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => ''do
      collection  do
       get "list", :as => 'list_events'
      end
    end

  end



  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :events, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
