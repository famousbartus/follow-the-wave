class PanelController < ApplicationController
  layout 'follow'
  def wave
    
  end

  def new
    @picture = Picture.create( params[:picture] )
    redirect_to :controller => :main
  end
end
