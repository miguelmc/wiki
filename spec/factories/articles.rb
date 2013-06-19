# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :text
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "This is a test title"
    summary "I have learn a lot in this testing excersice"
    content "To really test an article the right way you have to write good test cases, if you don't do it it will be something you'll have the blame for ever and ever."
    user { FactoryGirl.create(:user) }

    factory :article_with_category do
      category { FactoryGirl.create(:category) }
    end
  end
end
