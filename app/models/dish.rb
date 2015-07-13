class Dish < ActiveRecord::Base
   validates :title, presence: true
end