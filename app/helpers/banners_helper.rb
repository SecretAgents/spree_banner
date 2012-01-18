module BannersHelper
  
  def insert_banner(params={})
    max = params[:max] || 1
    category = params[:category] || ""
    banner = Banner.enable(category).limit(max)
    if !banner.blank?
      banner = banner.sort_by { |ban| ban.position }

      content_tag(:div, content_tag(:ul, raw(banner.map do |ban| content_tag(:li, image_tag(ban.attachment.url(:custom))) end.join) ), :class => "banner")
    end
  end
  
end