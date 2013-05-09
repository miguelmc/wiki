# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

require 'spec_helper'

describe Comment do
  let(:comment) { FactoryGirl.create(:comment) }

  subject { comment }

  it { should respond_to(:content) }
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }

  it { should validate_presence_of(:content) }
end
