class UsersController < ApplicationController

    before_filter :authenticate

    def new
        @user = User.new
    end 

    def create

        @user = User.new(user_params)

        if @user.save 
            @user_info = Userinfo.new(userinfo_params)
            @user_info.user_id = @user.id

                if @user_info.save
                session[:user_id] = @user.id
                session[:expire_on] = SESSION_EXPIRY_MINUTES.minutes.from_now
                redirect_to products_path, :notice => "Sign up successful. Welcome #{@user.userinfo.first_name}!"
                else
                
                User.delete(@user)
                @user = User.new

                @errors = @user_info.errors.messages

                render :action => :new

                end
        else

            @errors = @user.errors.messages

            render :action => :new
        end

    end 


    def destroy

        @user_id = params[:id]

        Userinfo.find_by(user_id: @user_id).update_attributes(active_status: 0)

        redirect_to products_path

    end 

    def show

        @user = User.find_by(id:params[:id])
        @user_info = @user.userinfo
        @count_products = @user.products.count
        @count_reviews = @user.reviews.count

        @products = @user.products

    end 

    private

    def user_params

        params.require(:user).permit(:user_name,:password,:password_confirmation)

    end  

    def userinfo_params

        params.require(:userinfo).permit(:first_name,:last_name,:active_status)

    end 

end
