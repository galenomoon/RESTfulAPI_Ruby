Rails.application.routes.draw do
  resources :auths, only: [:create]
  resources :kinds

  scope module: 'v1' do
    resources :contacts, :constraints => lambda {|request|  request.params[:version] == "1" } do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      #Singular Phone
      resource :phone, except: [:show]
      resource :phone, except: [:show], path: 'relationships/phones'

      #Plural Phone
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda {|request|  request.params[:version] == "2" }  do
      resource :kind, only: [:show]
      resource :kind, only: [:show], path: 'relationships/kind'

      #Singular Phone
      resource :phone, except: [:show]
      resource :phone, except: [:show], path: 'relationships/phones'

      #Plural Phone
      resource :phones, only: [:show]
      resource :phones, only: [:show], path: 'relationships/phones'

      resource :address, only: [:show, :update, :create, :destroy]
      resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address'
    end
  end
  #RESOURCES | Cria um padrão REST de rotas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
