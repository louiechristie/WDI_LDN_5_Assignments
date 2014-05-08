class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :review

  validates :title, presence: true, length: {maximum: 255}
  validates :year, presence: true
  validates_numericality_of :year, :only_integer => true, :allow_nil => false, 
    :greater_than_or_equal_to => 1800,
    :less_than_or_equal_to => Time.now.year

  def plot

    if title && title > "" && year
      
      url_title = title.gsub(' ', '+')

      url = "http://www.omdbapi.com/?t=#{url_title}&y=#{year}&"

      json = HTTParty.get(url) rescue nil

      if json
        hash = JSON(json) rescue {}
        if hash['Plot'] && hash['Plot'] > "" 
          hash['Plot']
        else
          "Plot information not available from internet"
        end
      else
        "Plot information not available from internet"
      end
    else
      "Plot information not available from internet"
    end
  end
end
