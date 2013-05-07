def sign_in(user)
  visit new_user_session_path
	fill_in t("users.session.form.username"), with: user.username
  fill_in t("users.session.form.password"), with: "foobar123"
  click_on t("users.session.form.submit")
end

def sign_out(user)
  click_on t("users.session.button.logout")
end
