class UpdatesMailer < ActionMailer::Base
  default from: "no-reply@icalialabs.com"

  def new_article(user, article)
    @user = user
    @article = article
    mail(to: @user.email, subject: "Nuevos articulos en la wiki de IcaliaLabs")
  end
end
