module Api
  class SeriesController < ApplicationController
    def index
      if params[:filter]
        series = Serie.where(status: params[:filter])
      else
        series = Serie.all
      end

      render json: series.as_json(methods: :rented)
    end

    def show
      render json: Serie.find(params[:id]).as_json(methods: [
        :rented,
        :total_duration,
        :episodes_list,
        :episodes_count
      ])
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end