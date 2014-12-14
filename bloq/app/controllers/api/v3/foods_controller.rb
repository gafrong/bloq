module Api
  module V3
    class FoodsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Food.all)
      end

      def show
        respond_with(Food.find(params[:id]))
      end

    private
      def todo_params
        params.require(:food).permit(:title)
      end
    end
  end
end