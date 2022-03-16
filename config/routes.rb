Rails.application.routes.draw do
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'
  end

  #RESOURCES | Cria um padrão REST de rotas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
