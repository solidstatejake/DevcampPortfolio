# Here in the routes file, we can pass whatever relative path we want to the
# first argument of get. That way, we can make the url whatever we want.
# The second argument has to be an `Action#Controller` pair.
#
# SEE `rake routes` in the terminal to determine where to route.
Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

	root to: 'pages#home'
end

