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

require 'spec_helper'

describe Article do
  let(:user) { FactoryGirl.create(:user) }
  let(:article) { FactoryGirl.create(:article, user: user) }

  subject { article }

  it { should respond_to(:title) }
  it { should respond_to(:summary) }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should have_many(:tags) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:summary) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Article.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  describe "#logs" do
    before do
      article.audits << stub_model(Audited::Adapters::ActiveRecord::Audit)
    end
    it "should return logs" do
      article.logs.size == 1
    end
  end
   describe "search" do
    before do
       FactoryGirl.create(:article, user: user, tag_list: ["hola", "si"])
       FactoryGirl.create(:article, user: user, tag_list: ["hola", "no"])
       FactoryGirl.create(:article, user: user, tag_list: ["hola"])
       FactoryGirl.create(:article, user: user, tag_list: ["si"])
    end
    it "should return article with those tags" do
     Article.search(tag: 'hola').size.should eql 3
    end
  end
end
