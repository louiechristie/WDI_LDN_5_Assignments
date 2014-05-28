require_relative 'card'

class CardFile

  def CardFile.process(input_file, output_file)

    while (in_line = input_file.gets)
        
        card = Card.new(in_line)

        out_line = "    "+card.card_type+": "+card.card_number
        
        # add spaces to pad out file
        no_of_spaces = 32 - out_line.length
        space = ""
        no_of_spaces.times do
          space << " "
        end

        out_line << space+" ("+card.check+")"

        output_file << out_line+"\n"
    end

  end

end
