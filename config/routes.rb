# frozen_string_literal: true

Rails.application.routes.draw do
  get 'authors', to: 'authors#all', as: 'authors'
  get 'author/:slug', to: 'authors#show', as: 'author'

  get 'categories/all', to: 'categories#all'
  get 'category/:slug', to: 'categories#show', as: 'category'

  get 'main/:slug', to: 'main_category#show', as: 'main_category'

  get '/articles', to: 'articles#all'
  get 'article/:slug', to: 'articles#show', as: 'article'
  get '/search', to: 'articles#search'

  get '/despre', to: 'about#noi'

  get '/contact', to: 'about#index'
  post '/contact', to: 'about#create'

  get '/termeni-si-conditii', to: 'about#T_C'
  get '/cookies', to: 'about#cookies'

  get '/404', to: "errors#not_found"
  get '/422', to: "errors#unacceptable"
  get '/500', to: "errors#internal_error"

  namespace :admin do
    resources :authors
    resources :main_categories
    resources :articles
    resources :categories
  end

  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'

  get 'articles/index'
  root to: 'articles#index'

  get '/sitemap', to: 'about#sitemap'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
