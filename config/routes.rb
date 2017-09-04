Rails.application.routes.draw do
  get 'events/reg'

  get 'sign/in_new'
  post 'sign/in_create'
  get 'sign/up_new'
  post 'sign/up_create'
  get 'sign/destroy'

	root 'main#index'
  get 'main/index'
  post 'main/register'
  get 'main/register'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
