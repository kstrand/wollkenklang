Mp3app::Application.routes.draw do

	match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
	
  match "songs/upload", :as => "upload"
  match "songs/delete", :as => "delete"
  root :to => "Songs#index"

end
