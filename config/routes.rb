Rails.application.routes.draw do
  namespace :api do
    resources :movies, only: [:index, :show] do
      patch :playback, to: :member
      patch :rating, to: :member
    end
    resources :series, only: [:index, :show] do
      patch :playback, to: :member
      patch :rating, to: :member
    end
    resources :episodes, only: [:show]
    resources :rentals, only: [:index] do
      collection do
        post "movies/:movie_id", to: "rentals#create"
        post "series/:serie_id", to: "rentals#create"
      end
    end
  end
end