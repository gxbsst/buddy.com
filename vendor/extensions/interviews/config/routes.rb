Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :interviews do
    resources :interviews, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :interviews, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :interviews, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
