function dir_up(dir)
    prev_slash = findlast(x->x == '/', dir[1:end-1])
    return dir[1:prev_slash]
end

function day7(input)
    dir_dict = Dict()
    current_dir = ""
    for line in input
        if line[1:4] == "\$ cd"
            dir = line[6:end]
            if dir == "/"
                #init
                current_dir = dir
            elseif dir == ".."
                #moving shallower
                current_dir = dir_up(current_dir)
            else
                #moving deeper
                current_dir *= dir * "/"
            end
            if !in(current_dir, keys(dir_dict))
                dir_dict[current_dir] = 0
            end
        else
            if occursin(r"^[0-9]", line)
                file_size = parse(Int, split(line)[1])
                dir_dict[current_dir] += file_size
                tempdir = current_dir
                while tempdir != "/"
                    tempdir = dir_up(tempdir)
                    dir_dict[tempdir] += file_size
                end
            end
        end
    end
    
    filtered = filter(p->(p.second<100000),dir_dict)
    @show sum(values(filtered))
    needed = dir_dict["/"] - 40000000
    @show minimum(values(filter(p->(p.second>needed),dir_dict)))
end

open("day7.txt", "r") do f
    input = readlines(f)
    day7(input)
end