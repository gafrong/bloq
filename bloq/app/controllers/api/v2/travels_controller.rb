module Api
  module V2
    class DesignsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Travel.all)
      end

      def show
        respond_with(Travel.find(params[:id]))
      end

    private
      def todo_params
        params.require(:travel).permit(:title)
      end
    end
  end
end