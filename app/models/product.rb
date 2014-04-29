class Product < ActiveRecord::Base

    has_many :reviews
    belongs_to :user

    validates :name, :presence => true
    validates :description, :presence => true
    validates :category, :presence => true
    validates :image_url, :presence => true
    validates :price, :presence => true


    def show_price

        price_dollars = price/100.00

        sprintf("$%.2f",price_dollars)

    end 


end
