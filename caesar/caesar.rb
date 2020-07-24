require 'pry'
$scrambledStringArray = []
$scrambledString = ''

def scramble(string, shift)

    if shift.positive?
        string.each_char {|c| $scrambledStringArray << handlePositives(c.ord, shift)}
    elsif shift.negative?
        string.each_char {|c| $scrambledStringArray << handleNegatives(c.ord, shift)}
    end

    scrambledString = $scrambledStringArray.join('')
    puts $scrambledStringArray
end

def handlePositives(char, shift)
    while shift > 0
        if (65..90).include?(char)
            if (char == 90)
                char = 65
            else
                char += 1
            end
            shift -= 1
        elsif (97..122).include?(char)
            if (char == 122)
                char = 97
            else
                char += 1
            end
            shift -= 1
        else
            return char.chr
        end
    end
    return char.chr
end

def handleNegatives(char, shift)
    while shift < 0
        if (65..90).include?(char)
            if (char == 90)
                char = 65
            else
                char -= 1
            end
            shift += 1
        elsif (97..122).include?(char)
            if (char == 97)
                char = 122
            else
                char -= 1
            end
            shift += 1
        else
            return char.chr
        end
    end
    return char.chr
end

scramble('this is" an ...example string', -25)
