class Dish < ActiveRecord::Base
   validates :title, :description, presence: true
end