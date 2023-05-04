function check(cycle, value, total, CRT)
    CRT *= abs(((cycle - 1) % 40) - value) <= 1 ? "#" : "."
    if cycle % 40 == 20
        total += cycle * value
    elseif cycle % 40 == 0
        @show CRT
        CRT = ""
    end
    return total, CRT
end

function day10(input)
    cycle, value, total, CRT = 1, 1, 0, "#"
    for line in input
        cycle += 1
        if line[1] == 'a'
            total, CRT = check(cycle, value, total, CRT)
            cycle += 1
            value += parse(Int, line[6:end])
        end
        total, CRT = check(cycle, value, total, CRT)
    end
    @show total
end

open("day10.txt", "r") do f
    input = readlines(f)
    day10(input)
end