Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match 'movies/search-director/:id', to: 'movies#search_director', as: :search_director, via: [:get, :post]
end
