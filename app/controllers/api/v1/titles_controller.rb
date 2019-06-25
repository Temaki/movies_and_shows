module Api
  module V1
    class TitlesController < ApiController

      # GET /v1/titles
      def index
        @titles = Season.all + Movie.all
        @titles = @titles.sort_by { |st| st.created_at }.reverse
        render json: @titles
      end

    end
  end
end