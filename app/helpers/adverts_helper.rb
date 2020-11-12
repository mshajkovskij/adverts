module AdvertsHelper
  def preview(advert)
    advert.text.truncate(160, separator: ' ')
  end

  def raw_textile(text)
    RedCloth.new(text.gsub('<', '&lt;').gsub('>', '&gt;')).to_html.html_safe
  end
end
