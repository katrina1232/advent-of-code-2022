function build_stacks(input)
    stacks = [[],[],[],[],[],[],[],[],[]]
    for (i, line) in enumerate(input)
        if line[2] == '1'
            return stacks, input[i+2:end]
        else
            for (x, c) in enumerate(line[2:4:end])
                c != ' ' && pushfirst!(stacks[x], c)
            end
        end
    end
end

function day5(input)
    message = ""
    stacks, moves = build_stacks(input)
    for line in moves
        nums = map(eachmatch(r"\d+", line)) do m
            parse(Int, m.match)
        end
        n,a,b = nums
        for _ in 1:n
            x = pop!(stacks[a])
            push!(stacks[b], x)
        end
    end
    for s in stacks
        message *= s[end]
    end
    @show message
end

function day5_part2(input)
    message = ""
    stacks, moves = build_stacks(input)
    for line in moves
        nums = map(eachmatch(r"\d+", line)) do m
            parse(Int, m.match)
        end
        n,a,b = nums
        to_move = reverse!([pop!(stacks[a]) for _ in 1:n])
        for x in to_move
            push!(stacks[b], x)
        end
    end
    for s in stacks
        message *= s[end]
    end
    @show message
end

open("day5.txt", "r") do f
    input = readlines(f)
    day5(input)
    day5_part2(input)
end