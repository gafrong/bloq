class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :set_headers
  # before_action :authenticate_user!
  
  def index
    
    @designs  = Design.all
    @travels  = Travel.all
    @foods    = Food.all
    @techs    = Tech.all
    @show_all = (@travels + @designs + @foods + @techs).shuffle

    respond_to do |format|
      format.html {}
      format.json { render :json => @show_all }
    end
  end

  def set_headers
    if request.headers["HTTP_ORIGIN"]
    # better way check origin
    # if request.headers["HTTP_ORIGIN"] && /^https?:\/\/(.*)\.some\.site\.com$/i.match(request.headers["HTTP_ORIGIN"])
      headers['Access-Control-Allow-Origin']      = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers']    = 'ETag'
      headers['Access-Control-Allow-Methods']     = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers']     = '*'
      headers['Access-Control-Max-Age']           = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
      end
  end
  
end
