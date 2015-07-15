class Dish < ActiveRecord::Base
   belongs_to :fan

   validates :title, :description, presence: true
   validates :cost, :pax, numericality: { greater_than: 0 }

   scope :search_keyword, ->(keyword) { where('title ILIKE ?', "#{keyword}%") }
end