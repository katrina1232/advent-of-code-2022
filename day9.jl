function move_tail(h, t)
    if abs(h[1] - t[1]) > 1
        h[1] > t[1] ? t = (t[1] + 1, t[2]) : t = (t[1] - 1, t[2])
        if h[2] != t[2]
            h[2] > t[2] ? t = (t[1], t[2] + 1) : t = (t[1], t[2] - 1)
        end
    elseif abs(h[2] - t[2]) > 1
        h[2] > t[2] ? t = (t[1], t[2] + 1) : t = (t[1], t[2] - 1)
        if h[1] != t[1]
            h[1] > t[1] ? t = (t[1] + 1, t[2]) : t = (t[1] - 1, t[2])
        end
    end
    return t
end

function move(rope, d, visited)
    if d == 'R'
        rope[1] = (rope[1][1] + 1, rope[1][2])
    elseif d == 'L'
        rope[1] = (rope[1][1] - 1, rope[1][2])
    elseif d == 'U'
        rope[1] = (rope[1][1], rope[1][2] + 1)
    elseif d == 'D'
        rope[1] = (rope[1][1], rope[1][2] - 1)
    end
    for i in eachindex(rope[2:end])
        rope[i+1] = move_tail(rope[i], rope[i+1])
    end
    union!(visited, [rope[end]])
    return rope, visited
end

function day9(input, part2=false)
    visited = Set()
    rope = part2 ? [(0,0),(0,0),(0,0),(0,0),(0,0),(0,0),(0,0),(0,0),(0,0),(0,0)] : [(0,0),(0,0)]
    for line in input
        d = line[1]
        n = parse(Int, line[3:end])
        for _ in 1:n
            rope, visited = move(rope, d, visited)
        end
    end
    @show length(visited)
end

open("day9.txt", "r") do f
    input = readlines(f)
    day9(input)
    day9(input, true)
end