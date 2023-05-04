function day4(input)
    contained = 0
    overlap = 0
    for line in input
        dash1, dash2, comma = findfirst(x->x=='-', line), findlast(x->x=='-', line), findfirst(x->x==',', line)
        elf1, elf2 = parse(Int,line[1:dash1-1]):parse(Int,line[dash1+1:comma-1]), parse(Int,line[comma+1:dash2-1]):parse(Int,line[dash2+1:end])
        if elf1[1] >= elf2[1] && elf1[end] <= elf2[end] || elf1[1] <= elf2[1] && elf1[end] >= elf2[end]
            contained += 1
            overlap += 1 
        elseif elf1[1] <= elf2[1] <= elf1[end] || elf2[1] <= elf1[1] <= elf2[end]
            overlap += 1
        end
    end
    @show contained
    @show overlap
end

open("day4.txt", "r") do f
    input = readlines(f)
    day4(input)
end