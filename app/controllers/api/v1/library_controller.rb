module Api
  module V1
    class LibraryController < ApiController

      before_action :set_user

      # GET /v1/library
      def index
        @titles = Purchase.active_for_user(@user).order('created_at DESC')
        render json: @titles
      end

      private

      def set_user
        @user = User.find params[:user_id]
      end

    end
  end
end