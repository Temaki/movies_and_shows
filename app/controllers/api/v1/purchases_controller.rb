module Api
  module V1
    class PurchasesController < ApiController

      # POST /v1/purchases
      def create
        @purchase = Purchase.new(purchase_params)
        if @purchase.save
          render json: @purchase, status: :created
        else
          render json: { message: 'Validation failed', errors: @purchase.errors }, status: :unprocessable_entity
        end

      end

      private

      def purchase_params
        params.require(:purchase).permit([
          :user_id,
          :purchase_option_id
        ])
      end

    end
  end
end