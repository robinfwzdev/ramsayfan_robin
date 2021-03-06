class Dish < ActiveRecord::Base
	 acts_as_votable
   belongs_to :fan

   validates :title, :description, presence: true
   validates :cost, :pax, numericality: { greater_than: 0 }

   scope :search_keyword, ->(keyword) { where('title ILIKE ?', "#{keyword}%") }
   scope :getDishesByFan, ->(fan_id)  { where('fan_id = ?', fan_id) }
   scope :published,      ->          { where(published: true) }
   scope :approved,       ->          { where(approved: true) }
end