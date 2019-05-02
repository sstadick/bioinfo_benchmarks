
def main()
    count = 0
    STDIN.each_line do |line|
        vals =line.split('\t')
        count +=  vals.size
    end
    puts count
end

main()