require 'spec_helper'

describe 'new article' do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
    visit new_article_path
  end

  it "created succesfully" do
    fill_in t("articles.new.form.title"), with: "Article's title"
    fill_in t("articles.new.form.summary"), with: "This is the summary for the article"
    fill_in t("articles.new.form.content"), with: "Here you have the content for the article."
    click_on t("articles.new.form.submit")
    page.should have_content t("articles.new.messages.success.saved")
  end
  context "when user is not signed in" do
    before do 
      sign_out @user 
      visit new_article_path
    end
    it "redirects to root_path" do
      page.should have_content t("devise.failure.unauthenticated")
    end
  end
  
end