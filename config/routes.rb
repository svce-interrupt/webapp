Rails.application.routes.draw do
	root 'main#index'
  get 'main/index'
  post 'main/register'
  get 'main/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
