class Section < ApplicationRecord
    belongs_to :compilation
    has_many :subtopics
end
