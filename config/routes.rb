Rails.application.routes.draw do
 
      resources :users
      resources :studios
      resources :work_hours
      get 'work_hours/calcHour/:id', to: 'work_hours#calcHour'
      resources :products
      resources :fixed_expenses
      get 'fixed_expenses/calcFixedExpense/:id', to: 'fixed_expenses#calcFixedExpense'
      resources :variable_expenses
      resources :variable_product_expenses

end
