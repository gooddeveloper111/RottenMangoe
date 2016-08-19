Rails.application.routes.draw do
  get 'tmovies/index'

  get 'tmovies/show'

  get 'tmovies/new'

  get 'tmovies/edit'

  get 'movies/index'

  get 'movies/show'

  get 'movies/new'

  get 'movies/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
