class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 100}
    validates :description, presence: true, length: { minimum: 10 }
    validates :short_description, presence: true, length: { minimum: 10 , maximum: 300 }
    validates :tag, presence: true

  end