function day2(input)
    points = 0  
    for line in input
        you = findfirst(line[1], "ABC")[1]
        me = findfirst(line[3], "XYZ")[1]
        points += me
        result = mod(you - me, 3)
        if result == 0
            points += 3
        elseif result == 2
            points += 6
        end
    end
    @show points
end

function day2_part2(input)
    points = 0 
    for line in input
        you = findfirst(line[1], "ABC")[1]
        result = findfirst(line[3], "YXZ")[1]
        me = mod(you - result, 3) + 1
        points += me
        if result == 1
            points += 3
        elseif result == 3
            points += 6
        end
    end
    @show points
end

open("day2.txt", "r") do f
    input = readlines(f)
    day2(input)
    day2_part2(input)
end