class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", 
                                         :thumb => "174x174>", 
                                         :poster => "170x240>",
                                         :logo => "170x170>",
                                         :website => "255x170>",
                                         :threeds => "227x170>",
                                         :wallpaper => "227x170>"}
  
  named_scope :wallpapers, :conditions => {:picture_type => "wallpaper"}
  named_scope :websites, :conditions => {:picture_type => "website"}
  named_scope :threeds, :conditions => {:picture_type => "3d"}
  named_scope :logos, :conditions => {:picture_type => "logo"}
  named_scope :posters, :conditions => {:picture_type => "poster"}
  
  def width
    dimensions = Paperclip::Geometry.from_file(self.image.to_file(:original))
    return width = dimensions.width
  end
  
  def height
    dimensions = Paperclip::Geometry.from_file(self.image.to_file(:original))
    return height = dimensions.height
  end 
end
