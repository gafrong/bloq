class DesignsController < ApplicationController

  def index
    @designs = Design.all

    respond_to do |format|
      format.html {}
      format.json { render :json => @designs }
    end
  end

end