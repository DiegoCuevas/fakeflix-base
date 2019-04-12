module Api
  class MoviesController < ApplicationController
    def index
      if params[:filter] && ["billboard", "preorder", "coming-soon" ].include?(params[:filter])
        movies = Movie.where(status: params[:filter])
      else
        movies = Movie.all
      end

      render json: movies.as_json(methods: :rented)
    end

    def show
      render json: Movie.find(params[:id]).as_json(methods: :rented)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end