function day6(input, part2=false)
    n = part2 ? 14 : 4
    println([i for i in eachindex(input[1:end-n]) if length(input[i:i+n-1]) == length(unique(input[i:i+n-1]))][1] + n - 1)
end

open("day6.txt", "r") do f
    input = readline(f)
    day6(input)
    day6(input, true)
end