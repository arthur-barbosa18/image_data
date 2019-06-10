# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :image_datas
        get 'imagem/', to: 'image_datas#get_data'
        get 'contagem/', to: 'image_datas#pixels_count'
    end
  end
end
