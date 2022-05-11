Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      resources :users
      resources :studios
      resources :work_hours
    end
  end
end
