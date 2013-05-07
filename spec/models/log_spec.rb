# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Log do
  
  let(:log) { FactoryGirl.create(:log) }

  subject { log }

  it { should belong_to(:article) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:article_id) }
  it { should validate_presence_of(:user_id) }

end
