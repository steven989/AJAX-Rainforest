class ReviewsController < ApplicationController

    before_filter :authenticate

    def create

        @product = Product.find_by(id: params[:product_id])

        if @product.reviews.new(review_params).save
            
            @reviews = @product.reviews

            respond_to do |format|
                format.html
                format.js
            end
        else
            
            render 'products/show'
            
        end

    end 


    def edit

        @product = Product.find_by(id: params[:product_id])
        @review = Review.find_by(id: params[:id])
        @user = session[:user_id]

    end 


    def update

        @product = Product.find_by(id: params[:product_id])
        @review = @product.reviews.find_by(id: params[:id])

        @review.update_attributes(review_params)

        redirect_to product_path(@product)

    end

    def destroy

        @product = Product.find_by(id: params[:product_id])
        @product.reviews.find_by(id: params[:id]).delete

        redirect_to product_path(@product)

    end 


    private

    def review_params

        params.require(:review).permit(:title, :content, :user_id)

    end 

end
