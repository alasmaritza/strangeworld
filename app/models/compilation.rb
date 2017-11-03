class Compilation < ApplicationRecord
    belongs_to :user
    has_many :sections
    
    validates :title, presence: true
    validates :description, presence: true
    validates :donation, presence: true, numericality: {greater_than_or_equal_to: 0}
end
