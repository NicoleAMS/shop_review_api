Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :areas, :only => [:index, :show]
      resources :shops, :only => [:index]
      resources :reviews, :only => [:index]
      resources :scores, :only => [:index]
    end
  end
end
