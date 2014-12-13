class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index
    @designs = Design.all
    @travels = Travel.all

    @show_all = (@travels + @designs).shuffle
    
    respond_to do |format|
      format.html {}
      format.json { render :json => @designs }
    end
  end
  
end
