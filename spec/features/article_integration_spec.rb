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
describe 'a created article' do
  before do
    @article = FactoryGirl.create :article
    @user = FactoryGirl.create :user
    sign_in @user
    visit edit_article_path(@article)
  end
  context "succesfully edited" do
    it "should update content" do
      fill_in t("articles.edit.form.title"), with: "Article's new title"
      fill_in t("articles.edit.form.summary"), with: "This is the new summary for the article"
      fill_in t("articles.edit.form.content"), with: "Here you have the new content for the article."
      click_on t("articles.edit.form.submit")
      page.should have_content t("articles.edit.messages.success.saved")
    end
  end
  context "when article is displayed" do
    before do
      @article = FactoryGirl.create(:article)
      visit article_path(@article)
    end

    it "should show article logs" do
      within ".logs" do
        page.should have_css('.log', count: 1)
      end
    end
  end
  context "in the index page" do
    before do
      @second_article =  FactoryGirl.create(:article, created_at: 2.years.ago)
      visit articles_path
    end
    it "should show a list of recent articles" do
       within ".articles" do
        page.should have_css('.article', count: 2)
      end

    end
  end
  context "when edited" do
    before do
      fill_in t("articles.edit.form.title"), with: "Article's new title"
      fill_in t("articles.edit.form.summary"), with: "This is the new summary for the article"
      fill_in t("articles.edit.form.content"), with: "Here you have the new content for the article."
      click_on t("articles.edit.form.submit")
    end
    it "should have various logs" do
      within ".logs" do
        page.should have_css('.log', count: 2)
      end
    end
  end
end
