module Api
  module V1
    class TitlesController < ApiController

      # GET /v1/titles
      def index
        @titles = Season.order('created_at DESC') + Movie.order('created_at DESC')
        render json: @titles
      end

    end
  end
end