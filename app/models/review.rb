class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    validates :title, presence: true
    validates :content, presence: true

end
