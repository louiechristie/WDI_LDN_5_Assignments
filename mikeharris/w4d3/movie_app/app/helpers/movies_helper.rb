module MoviesHelper

def actors
   actors = @movie.actor_ids.map{|id| Actor.find(id).name}
end


def error_msg(field)
    case field 
    when :title
      @movie.errors[:title].first.capitalize if @movie.errors[:title].any? 
    else 
      ""  
    end  
  end


end
