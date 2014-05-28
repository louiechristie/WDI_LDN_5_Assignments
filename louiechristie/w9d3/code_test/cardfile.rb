require_relative 'card'

class CardFile

  def CardFile.process(input_file, output_file)

    while (in_line = input_file.gets)
        card = Card.new(in_line)

        out_line = "    "+card.card_type+": "+card.card_number+"    ("+card.check+")"
        puts out_line
        output_file << out_line+"\n"
    end

  end

end
