class User < ActiveRecord::Base

    has_many :reviews
    has_many :products
    has_one :userinfo

    has_secure_password

    validates :user_name, :presence => true, :length => { minimum: 5}


end
