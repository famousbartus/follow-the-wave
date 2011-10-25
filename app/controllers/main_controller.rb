class MainController < ApplicationController
  layout 'follow'

  def index
    @pictures = {
      :wallpapers => Picture.wallpapers.reverse,
      :websites => Picture.websites.reverse,
      :logos => Picture.logos.reverse,
      :posters => Picture.posters.reverse,
      :threeds => Picture.threeds.reverse }
  end

  def image
    @picture = Picture.find(params[:id])
  end

  def send_email
    from = params[:email][:from]
    body = params[:email][:body]
    title = params[:email][:title]
    mail = Kontakt.create_send_email_to_me(from, title, body)
    Kontakt.deliver(mail)
    @pictures = {
      :wallpapers => Picture.wallpapers.reverse,
      :websites => Picture.websites.reverse,
      :logos => Picture.logos.reverse,
      :posters => Picture.posters.reverse,
      :threeds => Picture.threeds.reverse }
    @message = "Your email was sent."
    render :action => :index
  end
end
