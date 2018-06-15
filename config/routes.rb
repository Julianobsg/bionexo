Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ubss, only: :index
      get 'find_ubs' => 'ubss#index'
    end
  end
end
