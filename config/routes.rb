Mp3app::Application.routes.draw do
  match "songs/upload", :as => "upload"
  match "songs/delete", :as => "delete"
  root :to => "Songs#index"

end
