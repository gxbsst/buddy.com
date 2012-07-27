Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :shares do
    resources :shares, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :shares, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :shares, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
