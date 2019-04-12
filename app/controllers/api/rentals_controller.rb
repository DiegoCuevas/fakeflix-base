module Api
  class RentalsController < ApplicationController
    def index
      movies = Rental.list_rentables("Movie")
      series = Rental.list_rentables("Serie")
      render json: {
        :movies => movies,
        :series => series
      }
    end

    def create
      if params.key?(:movie_id)
        media = Movie.find(params[:movie_id])
      elsif params.key?(:serie_id)
        media = Serie.find(params[:serie_id])
      end

      render json: media.rentals.create(
        paid_price: media.price
      )
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end