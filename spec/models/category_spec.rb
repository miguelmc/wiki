# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:articles) }

   describe "accessible attributes" do
    it "should not allow access to name" do
      expect do
        Category.new(name: category.name)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end

