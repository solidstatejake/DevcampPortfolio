# Here in the routes file, we can pass whatever relative path we want to the
# first argument of get. That way, we can make the url whatever we want.
# The second argument has to be an `Action#Controller` pair.
#
# SEE `rake routes` in the terminal to determine where to route.
Rails.application.routes.draw do
  resources :portfolios
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  resources :blogs

	root to: 'pages#home'
end

