Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :areas, :only => [:index, :show, :create] do
        resources :shops, :only => [:create]
      end
      resources :shops, :only => [:index, :show] do
        resources :reviews, :only => [:create]
      end
      resources :reviews, :only => [:index] do
        resources :scores, :only => [:create]
      end
      resources :scores, :only => [:index, :show]
    end
  end
end
