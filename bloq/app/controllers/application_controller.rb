class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index
    @designs = Design.all
    @travels = Travel.all
    @foods = Food.all

    @show_all = (@travels + @designs + @foods).shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @show_all }
    end
  end
  
end
