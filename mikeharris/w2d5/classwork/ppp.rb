def ppp(nos)

  (1..nos).each do |i|
    output = ""

    if i % 3 == 0
        output << "Pling"
    end

    if i % 5 == 0 
        output << "Plang"
    end

    if i % 7 == 0  
        output << "Plong"
    end

    if output == "" 
      output = i.to_s
    end  

    output << ","
    print output

  end

    print "\b "
end


ppp(105)


def ppp_rec(i, nos)
    
    if i == (nos + 1) then 
      print ""
    else  

      output = ""

      if i % 3 == 0
          output << "Pling"
      end

      if i % 5 == 0 
          output << "Plang"
      end

      if i % 7 == 0  
          output << "Plong"
      end

      if output == "" 
        output = i.to_s
      end  

      output << ","
      print output

      ppp_rec(i + 1, nos)

    end

end



print "\n\n"

ppp_rec(1,105)







