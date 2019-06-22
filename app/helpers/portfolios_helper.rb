module PortfoliosHelper

  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img portfolio, type
    if type == 'thumb'
      portfolio.thumb_image.url || image_generator(height: '350', width: '200')
    elsif type == 'main'
      portfolio.main_image.url || image_generator(height: '600', width: '400')
    end
  end

end
