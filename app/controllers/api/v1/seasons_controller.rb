module Api
  module V1
    class SeasonsController < ApiController

      # GET /v1/seasons
      def index
        @seasons = Season.order('created_at DESC')
        render json: @seasons
      end

    end
  end
end