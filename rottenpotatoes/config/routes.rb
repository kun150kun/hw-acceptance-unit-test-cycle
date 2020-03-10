Rottenpotatoes::Application.routes.draw do
  resources :movies do 
    get 'find_movies_with_same_directors'
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
