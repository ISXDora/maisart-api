Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do 
      
      resources :users
      resources :studios
      resources :work_hours
      resources :products
      resources :fixed_expenses
      resources :variable_expenses
      resources :variable_product_expenses

    end
  end
end
