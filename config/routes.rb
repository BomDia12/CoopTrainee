Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'
  scope 'artists' do
    get '/', to:'artists#index', as: :artists
    get '/new', to:'artists#new', as: :new_artist
    post '/new', to:'artists#create'
  end
end
