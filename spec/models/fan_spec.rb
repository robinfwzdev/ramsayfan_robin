require 'rails_helper'

RSpec.describe Fan, type: :model do
  context 'Validation' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
  end    
end
