# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    scope module: 'posts', shallow: true do
      resources :comments, except: %i[new show]
      resources :likes, only: %i[create destroy]
    end
  end
  root to: 'posts#index'
end
