class MoviesController < ApplicationController
  
  def index
    # @movies = Movie.all
    @q = Movie.search(params[:q])
    @movies = @q.result(distinct: true)
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actor_ids.map{|id| Actor.find(id)}
  end

  def new
    @movie = Movie.new
  end

  def edit 
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(params[:movie])
    

    @title = @movie.title
    if @title && @title > "" 
      @url_title = @title.downcase.tr(' ','+')
      url = "http://www.omdbapi.com/?t=#{@url_title}"
      html = HTTParty.get(url)
      @hash = JSON(html)
      
      unless @hash["Response"] == "False"
 
        actors = @hash["Actors"].split(",").map(&:strip)
        actor_ids = []
        actors.each do |actor|
          a = Actor.new(name:actor)
          a.save
          actor_ids << Actor.find_by_name(actor).id
        end
 
        new_params  = Movie.new.as_json
        new_params.each_key do |key|
          new_params[key] = @hash[key.capitalize]  
        end
        new_params.delete("created_at")
        new_params.delete("updated_at")
        new_params.delete("actors")
        new_params["actor_ids"] = actor_ids
        @movie.update_attributes(new_params)
      end
    end
     
    
    if @movie.save
      flash[:nofilm] = "No film by that name - however we've added it to the database for you" unless @movie.year 
      redirect_to  movies_path
    else 
      render action: "new" 
    end
  end

  def update
    
    @movies = Movie.all

    @movies.each do |movie|
    
      @title = movie.title
      if @title && @title > "" 
        @url_title = @title.downcase.tr(' ','+')
        url = "http://www.omdbapi.com/?t=#{@url_title}"
        html = HTTParty.get(url)
        @hash = JSON(html)
        
        unless @hash["Response"] == "False"
   
          actors = @hash["Actors"].split(",").map(&:strip)
          actor_ids = []
          actors.each do |actor|
            a = Actor.new(name:actor)
            a.save
            actor_ids << Actor.find_by_name(actor).id
          end
          
   
          keys = Movie.new.to_yaml.split(": \n").map(&:strip)
          keys.shift
          new_params = {}
          keys.each do |key|
            new_params[key] = @hash[key.capitalize]  
          end
          new_params.delete("created_at")
          new_params.delete("updated_at")
          new_params.delete("actors")
          new_params["actor_ids"] = actor_ids
          movie.update_attributes(new_params)
          
        end
      end
    end

      redirect_to movies_path
  end



  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
      


    redirect_to movies_path

  end

end
