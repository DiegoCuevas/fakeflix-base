module Api
  class EpisodesController < ApplicationController
    def show
      render json: Episode.find(params[:id]).as_json(methods: :serie_id)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end
  end
end