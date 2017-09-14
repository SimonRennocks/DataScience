function foo(z)
    c = z
    maxiter = 80
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end

    return maxiter

end

foo(0.2)



const jobs = Channel{Int}(32);

 const results = Channel{Tuple}(32);

 function do_work()
           for job_id in jobs
               bada = 68 * 7
               exec_time = rand()
               sleep(exec_time)
                             # simulates elapsed time doing actual work
                                               # typically performed externally.
               put!(results, (job_id, exec_time, bada))
           end
       end;

 function make_jobs(n)
           for i in 1:n
               put!(jobs, i)
           end
       end;

n = 12;

@schedule make_jobs(n); # feed the jobs channel with "n" jobs

for i in 1:4 # start 4 tasks to process requests in parallel
           @schedule do_work()
       end

@elapsed while n > 0 # print out results
           job_id, exec_time, bada = take!(results)
           println("$bada: $job_id finished in $(round(exec_time,2)) seconds")
           n = n - 1
end
