class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "174x174>" }
  
  named_scope :wallpapers, :conditions => {:picture_type => "wallpaper"}
  named_scope :websites, :conditions => {:picture_type => "website"}
  named_scope :threeds, :conditions => {:picture_type => "3d"}
  named_scope :logos, :conditions => {:picture_type => "logo"}
  named_scope :posters, :conditions => {:picture_type => "poster"}
end
