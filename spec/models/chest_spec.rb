require 'spec_helper'

describe Chest do
  let(:user) { create(:user) }
  
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
  end
end
