Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :private_fund_snapshots do
      collection { post :import }
    end
end
