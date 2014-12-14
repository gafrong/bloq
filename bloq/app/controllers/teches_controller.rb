class TechesController < ApplicationController

  def index
    @teches = Tech.all 

    @show_all = @teches.shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @teches }
    end
  end

end

