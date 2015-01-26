Rails.application.routes.draw do
  #resources :brands do
  #  resources :categories
  #end
  
  
  
  resources :brands do
    resources :categories, shallow: true do
      resources :subcategories, :products, shallow: true do
        resources :typeproducts, shallow: true do
          resources :products, shallow: true do
          end
        end
      end
    end
  end
  
  root 'brands#index'
  
  
  
end
