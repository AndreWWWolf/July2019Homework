class Post < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :destroy
    

    validates(
        :title, 
        presence: true, 
        uniqueness: {case_sensitive: false}, 
        )
        
    validates(
        :body, 
        presence: true, 
        )
        validates_length_of :body, minimum: 50
end
