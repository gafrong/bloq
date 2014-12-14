module Api
  module V4
    class TechsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Tech.all)
      end

      def show
        respond_with(Tech.find(params[:id]))
      end

    private
      def todo_params
        params.require(:tech).permit(:title)
      end
    end
  end
end