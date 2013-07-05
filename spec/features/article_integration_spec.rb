require 'spec_helper'

describe 'new article' do
  before do
    @user = FactoryGirl.create :user
    @category = FactoryGirl.create :category
    sign_in @user
    visit new_article_path
  end

  it "created succesfully" do
    fill_in 'article[title]', with: "Article's title"
    fill_in 'article[summary]', with: "This is the summary for the article"
    select @category.name, from: 'article[category_id]'
    fill_in 'article[content]', with: "Here you have the content for the article."

    click_on 'Crear'
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
    @category = FactoryGirl.create :category
    sign_in @user
    visit edit_article_path(@article)
  end
  context "when previewed", js: true do
    before do
      click_link "Preview"
    end
    it "should display article's information on the same page" do
      within ".flip-preview" do
        page.should have_css('.header-content')
        page.should have_css('.info-article')
        page.should have_css('.article-content')
        page.should have_css('.instructions')
        page.should have_css('.buttons')
      end
    end
  end
  context "succesfully edited" do
    it "should update content" do
      fill_in 'article[title]', with: "Article's new title"
      fill_in 'article[summary]', with: "This is the new summary for the article"
      fill_in 'article[content]', with: "Here you have the new content for the article."
      select @category.name, from: 'article[category_id]'
      click_on 'Crear'
      page.should have_content t("articles.edit.messages.success.saved")
    end
  end
  context "in the index page" do
    before do
      @second_article =  FactoryGirl.create(:article, created_at: 2.years.ago)
      visit articles_path
    end
    it "should show a list of recent articles" do
       within "#js-articles" do
        page.should have_css('.link-item', count: 2)
      end

    end
  end
end
describe "an existing article" do
  context "when has comments" do
    before do
      @article = FactoryGirl.create(:article)
      @comment = FactoryGirl.create(:comment, commentable: @article)
      @category = @article.category
      visit article_path @article
    end
    it "should show them" do
       within "#js-comments" do
        page.should have_css('.coment', count: 1)
      end
    end
  end
end
describe "search" do
  before do
    FactoryGirl.create(:article, tag_list:"ruby, heroku, a la github")
    FactoryGirl.create(:article, tag_list:"heroku, a la github")
    visit root_path
  end
  it "should show one article" do
    fill_in "tag", with: "ruby"
    click_on "search"
    within "#js-articles" do
      page.should have_css('.link-item', count: 1)
    end
  end
  context "when user searches for no tag" do
    it "should show all" do
      fill_in "tag", with: ""
      click_on "search"
      within "#js-articles" do
        page.should have_css('.link-item', count: 2)
      end
    end
  end
end
