class TechsController < ApplicationController

  def index
    @techs = Tech.all 

    @show_all = @techs.shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @techs }
    end
  end

end

