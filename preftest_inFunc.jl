function main()
    result = 0.0
    n = 10000000
    for i in 1:n
        result += sin(rand())
    end
    return result
end
show(main())
