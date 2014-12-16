class FoodsController < ApplicationController

  def index
    @foods    = Food.all 
    
    @show_all = @foods.shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @foods }
    end
  end

end

