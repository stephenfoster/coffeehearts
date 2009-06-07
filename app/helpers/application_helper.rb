# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_media(media)
    if (media.class == Picture)
      render :partial => "shared/picture_bit", :locals=> {:picture_tag => (image_tag media.image.url(:thumb)), :picture_caption=>media.title}
    elsif (media.class == TextBlock)
      media.note
    elsif (media.class == BlogLink)
      render :partial => "shared/blog_bit", :locals=> {:blog_link => media.link}
    elsif (media.nil?)
      
    else
      raise "Unknown media type"
    end
  end

  def pic_for(thing)
    begin
    if (thing.class == Relationship)
      image_tag thing.main_picture.url(:thumb), {:width=>100,:height=>100}
    elsif (thing.class == User)
      image_tag thing.profile_picture.url(:thumb), {:width=>100,:height=>100}
    end
    rescue
    end
  end
end
