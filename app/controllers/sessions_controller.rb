class SessionsController < ApplicationController


    def new

        @redirect_source = params[:redirect_source]

    end 

    def create

        user = User.where(user_name: params[:user_name]).joins(:userinfo).merge(Userinfo.where(active_status:1)).take

        if user && user.authenticate(params[:password])

            session[:user_id] = user.id
            session[:expire_on] = SESSION_EXPIRY_MINUTES.minutes.from_now

            redirect_to params[:redirect_source] == nil ? products_path : params[:redirect_source]

        else

            render action: 'new'

        end 

    end 


    def destroy
    
        session[:user_id] = nil
        redirect_to products_path

    end 

end
