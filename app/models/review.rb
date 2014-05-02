class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    validates :title, :present
    validates :content, :present

end
