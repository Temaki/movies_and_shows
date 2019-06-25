module Api
  module V1
    class MoviesController < ApiController

      # GET /v1/movies
      def index
        @movies = Movie.order('created_at DESC')
        render json: @movies
      end

    end
  end
end