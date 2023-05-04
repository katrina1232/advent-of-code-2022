function get_directions(forest, y, x)
    left = reverse!(forest[y, 1:x-1])
    right = forest[y, x+1:end]
    top = reverse!(forest[1:y-1, x])
    bottom = forest[y+1:end, x]
    return [left, right, top, bottom]
end

function visibility_score(directions,height,max_score)
    score = 1
    for d in directions
        d_score = findfirst(x->x>=height, d)
        if isnothing(d_score)
            d_score = length(d)
        end
        score *= d_score
    end
    return maximum([score, max_score])
end

function day8(input)
    x = length(input)
    forest = zeros(Int8, x, x)
    for (i, line) in enumerate(input)
        for (j, tree) in enumerate(line)
            forest[i, j] = tree - '0'
        end
    end
    visible = 0
    max_score = 0
    for x in 1:size(forest,1)
        for y in 1:size(forest,2)
            directions = get_directions(forest, y, x)
            height = forest[y, x]
            seen = any(direction->all(x->x<height, direction), directions)
            seen && (visible +=1)
            max_score = visibility_score(directions,height, max_score)
        end
    end
    @show visible
    @show max_score
end

open("day8.txt", "r") do f
    input = readlines(f)
    day8(input)
end