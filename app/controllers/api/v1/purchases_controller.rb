module Api
  module V1
    class PurchasesController < ApiController

      before_action :set_user

      # POST /v1/purchases
      def create
        @purchase = Purchase.new(purchase_params)
        @purchase.user = @user
        if @purchase.save
          render json: @purchase, status: :created
        else
          render json: { message: 'Validation failed', errors: @purchase.errors }, status: :unprocessable_entity
        end

      end

      private

      def purchase_params
        params.require(:purchase).permit([
          :purchase_option_id
        ])
      end

      def set_user
        @user = User.find params[:user_id]
      end

    end
  end
end