Rails.application.routes.draw do
  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[create]
  end
  resources :bookmarks, only: :destroy
  resources :lists, only: :destroy
end
