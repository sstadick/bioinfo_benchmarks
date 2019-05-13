using Base

function main()
    count = 0
    for line in eachline(stdin)
        for col in split(lowercase(line), "\t")
            if findfirst("bc", col[1:4]) != nothing
                count += 1
            end
        end
    end
    println(count)
end

main()