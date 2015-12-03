Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", :locale => /en/ do
    root	'static_pages#home'
    get 'home'=> 'static_pages#home'
    get 'about'=> 'static_pages#about'
    get 'contact'=> 'static_pages#contact'
	end
end
