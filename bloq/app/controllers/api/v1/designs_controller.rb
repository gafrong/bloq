module Api
  module V1
    class DesignsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Design.all)
      end

      def show
        respond_with(Design.find(params[:id]))
      end

    private
      def todo_params
        params.require(:design).permit(:info)
      end
    end
  end
end
