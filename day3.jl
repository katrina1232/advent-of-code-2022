using IterTools
function get_priority(c::Char)
    islowercase(c) ? c - 'a' + 1 : c - 'A' + 27
end

function day3(input)
    matches = ""
    priorities = 0
    for line in input
        half = floor(Int, length(line)/2)
        comp1, comp2 = line[1:half], line[half+1:end]
        matches *= intersect(comp1, comp2)[1]
    end
    for m in matches
        priorities += get_priority(m)
    end
    @show priorities
end

function day3_part2(input)
    priorities = 0
    for group in IterTools.partition(input, 3)
        b = intersect(group...)[1]
        priorities += get_priority(b)
    end
    @show priorities
end

open("day3.txt", "r") do f
    input = readlines(f)
    day3(input)
    day3_part2(input)
end
