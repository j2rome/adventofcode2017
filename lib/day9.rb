class Day9
  def solve(input)
    nested = count = garbage_characters = 0
    in_garbage = skip_next = false

    input.each_char.each do |c|
      if skip_next
        skip_next = false
      else
        garbage_characters += 1 if in_garbage && c != '>' && c != '!'
        case c
        when '{'
          nested += 1 unless in_garbage
        when '}'
          unless in_garbage
            count += nested
            nested -= 1
          end
        when '<'
          in_garbage = true
        when '>'
          in_garbage = false if in_garbage
        when '!'
          skip_next = true if in_garbage
        end
      end
    end
    [count, garbage_characters]
  end
end
