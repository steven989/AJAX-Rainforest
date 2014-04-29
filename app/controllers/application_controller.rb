class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  SESSION_EXPIRY_MINUTES = 15

  private

    def authenticate

    @authenticated = (Userinfo.find_by(user_id: session[:user_id], active_status: 1) != nil) && ((session[:expire_on] ||= '9999-12-31') && session[:expire_on] >= Time.now)

    puts '---------------------------------'
    puts @authenticated
    puts session[:user_id]
    puts '---------------------------------'
    end 



end
