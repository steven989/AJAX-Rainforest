class SessionsController < ApplicationController


    def new
        
        puts '-------------------------------------------'
        # puts params
        puts '-------------------------------------------'
        @redirect_source = params[:redirect_source]


    end 


end
