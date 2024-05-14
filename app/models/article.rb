class Article < ApplicationRecord
    validates :Title, presence: true,length: {minimum: 3,maximum: 100}
    validates :Description, presence: true,length: {minimum: 10,maximum: 300}
end