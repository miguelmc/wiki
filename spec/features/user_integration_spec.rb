require 'spec_helper'

describe "signin" do 
  before do
    @user = FactoryGirl.create :user
    visit new_user_session_path
  end

  it "succesful" do
    fill_in t("users.session.form.username"), with: @user.username
    fill_in t("users.session.form.password"), with: "foobar123"
    click_on t("users.session.form.submit")
    page.should have_content t("devise.sessions.user.signed_in")
  end
  it "unsuccesful" do
    fill_in t("users.session.form.username"), with: @user.username
    fill_in t("users.session.form.password"), with: "foobar124"
    click_on t("users.session.form.submit")
    page.should have_content t("devise.failure.invalid")
  end
end
describe "signout" do
  before do
    @user = FactoryGirl.create :user
    sign_in @user
  end
  it "succesful" do
    click_on t("users.session.button.logout")
    page.should have_content t("devise.sessions.user.signed_out")
  end
end
