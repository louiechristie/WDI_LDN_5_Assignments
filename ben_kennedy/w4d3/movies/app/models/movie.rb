class Movie < ActiveRecord::Base
  attr_accessible :image, :name, :review, :where_watched_id, :user_id, :plot


  belongs_to :user
  belongs_to :where_watched
    

  def omdb_pull
    title = self.name
    title_url = title.gsub(' ', '+')
    url = "http://www.omdbapi.com/?t=#{title_url}"
    html = HTTParty.get(url)
    hash = JSON(html)
    self.image = hash['Poster']
    self.plot = hash['Plot']
  end




end
