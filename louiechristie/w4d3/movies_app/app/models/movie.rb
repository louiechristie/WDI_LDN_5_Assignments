class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :review

  def plot

    if title && title > "" && year && year > 1800 && year <= Time.now.year
      
      url_title = title.gsub(' ', '+')

      url = "http://www.omdbapi.com/?t=#{url_title}&y=#{year}&"

      html = HTTParty.get(url)
      hash = JSON(html)

      hash['Plot']
    else
      nil
    end
  end

end
