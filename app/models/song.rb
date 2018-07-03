class Song < ApplicationRecord
    has_many :adds, dependent: :destroy 
    validates :title, :artist, presence: true
end
