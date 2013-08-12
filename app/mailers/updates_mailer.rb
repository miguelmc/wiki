class UpdatesMailer < ActionMailer::Base
  default from: "info@icalialabs.com"

  def new_article(user, article)
    @user = user
    @article = article
    mail(to: @user.email, subject: "Nuevos articulos en la wiki de IcaliaLabs")
  end

  def article_updated(user, article)
    @user = user
    @article = article
    mail(to: @user.email, subject: "Un articulo ha sido modificado en la wiki de IcaliaLabs")
  end
end
