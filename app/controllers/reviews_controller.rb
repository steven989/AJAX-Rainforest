class ReviewsController < ApplicationController

    before_filter :authenticate

    def create

        @product = Product.find_by(id: params[:product_id])

        @product.reviews.new(review_params).save

        redirect_to product_path(@product)

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
