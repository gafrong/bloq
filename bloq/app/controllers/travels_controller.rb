class TravelsController < ApplicationController

  def index
    @travels = Travel.all 

    @show_all = @travels.shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @travels }
    end
  end

end

