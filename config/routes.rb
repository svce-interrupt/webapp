Rails.application.routes.draw do
  get 'sign/up_new'
  get 'sign/up_create'=>'sign#up_new'
	post 'sign/up_create'
	get 'sign/in_new'
	get 'sign/in_create'=>'sign#in_new'
	post 'sign/in_create'
	get 'sign/out'
	get 'sign/up_confirm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
