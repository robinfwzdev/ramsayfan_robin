class Dish < ActiveRecord::Base
   validates :title, :description, presence: true
   validates :cost, :pax, numericality: { greater_than: 0 }

end