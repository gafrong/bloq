class DesignsController < ApplicationController

  def index
    @designs = Design.all

    @show_all = @designs

    # render json: @show_all

    respond_to do |format|
      format.html {}
      format.json { render :json => @designs }
    end
  end

end