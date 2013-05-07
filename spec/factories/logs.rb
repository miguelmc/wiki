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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :log do
    article { FactoryGirl.create(:article) }
    user { FactoryGirl.create(:user) }
  end
end
