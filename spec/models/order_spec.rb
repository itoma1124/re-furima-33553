require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.create(:order)
  end
end
