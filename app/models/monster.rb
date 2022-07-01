class Monster < ApplicationRecord
    validates :name, :age, :specialty, :quote, :image, presence: true
    validates :name, length: {minimum: 2}
    validates :age, length: {minimum: 1}
    validates :specialty, length: {minimum: 5}
    validates :quote, length: {minimum: 5}
    validates :image, length: {minimum: 8}

end
