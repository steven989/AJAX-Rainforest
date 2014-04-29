class ProductsController < ApplicationController

    before_filter :authenticate

    def index

        if params[:search_field]

        @products = Product.where("name like ?", "%#{params[:search_field]}%")

        else 

        @products = Product.all

        end 

    end 

    def search

        @products = Product.where("name like ?", "%#{params[:search_field]}%")

        puts '---------------------------------------------------'
        puts params.inspect
        puts '---------------------------------------------------'
        puts @products.inspect
        puts '---------------------------------------------------'

        render partial:'shared/product', collection: @products

    end 

    def show

        @product = Product.find_by(id: params[:id])

        @reviews = @product.reviews.order(:created_at => :desc)

        @review = @product.reviews.new

        @user = session[:user_id]
        
    end 

    def new
    
        @product = Product.new
        flash[:user_id] = session[:user_id] #passing the user ID so that it can be logged with the product in the create action

    end 

    def create

        @product = Product.new(product_params.merge(user_id: flash[:user_id]))
        
        unless @product.price.nil?
        @product.price = (@product.price * 100).to_i
         end

        if @product.save
            redirect_to product_path(@product)
        else 
            
            @errors = @product.errors.messages

            render 'new'

        end 

    end 


    def user_index

        @products = User.find_by(id: session[:user_id]).products

    end 

    def edit

        @product = Product.find_by(id: params[:id])

    end 

    def update

        @product = Product.find_by(id: params[:id])

        if @product.update_attributes(product_params)
            redirect_to products_path
        else 
            render action: :edit
        end 

    end 

    def destroy

        Product.destroy(params[:id])

        redirect_to products_path

    end 

    private

    def product_params

        params.require(:product).permit(:name,:category,:price,:description,:image_url)

    end 

end
