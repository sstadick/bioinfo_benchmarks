using Base

function checkBC(val)
    return occursin("bc", lowercase(val[2:4]))
end

function main()
    count = 0
    # for line in eachline(stdin)
    #     count += sum(checkBC, split(line, '\t'))
    # end
    println(count)
end

main()