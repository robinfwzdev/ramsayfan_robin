require "rails_helper"

RSpec.describe Dish, type: :model do
   context 'Validation' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_numericality_of(:cost).is_greater_than(0) }
   end
end