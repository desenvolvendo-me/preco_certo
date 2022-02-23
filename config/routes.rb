# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies
      resources :expenses
      resources :manpowers
      resources :products
      resources :product_raw_materials
      resources :production_goals
      resources :raw_materials
    end
  end
end
