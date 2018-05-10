Rails.application.routes.draw do
  root 'welcome#index'

  get '/:username', to: 'github_profiles#show'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
