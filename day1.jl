function day1(input)
    current_elf, elves = 0, []
    for line in input
        if line == ""
            push!(elves, current_elf)
            current_elf = 0 
        else 
            current_elf += parse(Int, line)
        end
    end
    sort!(elves, rev=true)
    println("top elf = ", elves[1], ", total of top three elves = ", sum(elves[1:3]))
end

open("day1.txt", "r") do f
    input = readlines(f)
    day1(input)
end