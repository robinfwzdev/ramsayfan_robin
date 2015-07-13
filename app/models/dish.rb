class Dish < ActiveRecord::Base
   validates :title, :description, presence: true
   validates :cost, numericality: { greater_than: 0 }
end