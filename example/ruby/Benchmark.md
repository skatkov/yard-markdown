# Module: Benchmark
    

The Benchmark module provides methods to measure and report the time used to
execute Ruby code.

*   Measure the time to construct the string given by the expression
    `"a"*1_000_000_000`:

        require 'benchmark'

        puts Benchmark.measure { "a"*1_000_000_000 }

    On my machine (OSX 10.8.3 on i5 1.7 GHz) this generates:

        0.350000   0.400000   0.750000 (  0.835234)

    This report shows the user CPU time, system CPU time, the sum of the user
    and system CPU times, and the elapsed real time. The unit of time is
    seconds.

*   Do some experiments sequentially using the #bm method:

        require 'benchmark'

        n = 5000000
        Benchmark.bm do |x|
          x.report { for i in 1..n; a = "1"; end }
          x.report { n.times do   ; a = "1"; end }
          x.report { 1.upto(n) do ; a = "1"; end }
        end

    The result:

            user     system      total        real
        1.010000   0.000000   1.010000 (  1.014479)
        1.000000   0.000000   1.000000 (  0.998261)
        0.980000   0.000000   0.980000 (  0.981335)

*   Continuing the previous example, put a label in each report:

        require 'benchmark'

        n = 5000000
        Benchmark.bm(7) do |x|
          x.report("for:")   { for i in 1..n; a = "1"; end }
          x.report("times:") { n.times do   ; a = "1"; end }
          x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
        end

The result:

                  user     system      total        real
    for:      1.010000   0.000000   1.010000 (  1.015688)
    times:    1.000000   0.000000   1.000000 (  1.003611)
    upto:     1.030000   0.000000   1.030000 (  1.028098)

*   The times for some benchmarks depend on the order in which items are run. 
    These differences are due to the cost of memory allocation and garbage
    collection. To avoid these discrepancies, the #bmbm method is provided. 
    For example, to compare ways to sort an array of floats:

        require 'benchmark'

        array = (1..1000000).map { rand }

        Benchmark.bmbm do |x|
          x.report("sort!") { array.dup.sort! }
          x.report("sort")  { array.dup.sort  }
        end

    The result:

        Rehearsal -----------------------------------------
        sort!   1.490000   0.010000   1.500000 (  1.490520)
        sort    1.460000   0.000000   1.460000 (  1.463025)
        -------------------------------- total: 2.960000sec

                    user     system      total        real
        sort!   1.460000   0.000000   1.460000 (  1.460465)
        sort    1.450000   0.010000   1.460000 (  1.448327)

*   Report statistics of sequential experiments with unique labels, using the
    #benchmark method:

        require 'benchmark'
        include Benchmark         # we need the CAPTION and FORMAT constants

        n = 5000000
        Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
          tf = x.report("for:")   { for i in 1..n; a = "1"; end }
          tt = x.report("times:") { n.times do   ; a = "1"; end }
          tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
          [tf+tt+tu, (tf+tt+tu)/3]
        end

    The result:

                     user     system      total        real
        for:      0.950000   0.000000   0.950000 (  0.952039)
        times:    0.980000   0.000000   0.980000 (  0.984938)
        upto:     0.950000   0.000000   0.950000 (  0.946787)
        >total:   2.880000   0.000000   2.880000 (  2.883764)
        >avg:     0.960000   0.000000   0.960000 (  0.961255)


# Class Methods
## benchmark(caption "", label_width nil, format nil, *labels ) [](#method-c-benchmark)
Invokes the block with a Benchmark::Report object, which may be used to
collect and report on the results of individual benchmark tests. Reserves
`label_width` leading spaces for labels on each line. Prints `caption` at the
top of the report, and uses `format` to format each line. (Note: `caption`
must contain a terminating newline character, see the default
Benchmark::Tms::CAPTION for an example.)

Returns an array of Benchmark::Tms objects.

If the block returns an array of Benchmark::Tms objects, these will be used to
format additional lines of output. If `labels` parameter are given, these are
used to label these extra lines.

*Note*: Other methods provide a simpler interface to this one, and are
suitable for nearly all benchmarking requirements.  See the examples in
Benchmark, and the #bm and #bmbm methods.

Example:

    require 'benchmark'
    include Benchmark          # we need the CAPTION and FORMAT constants

    n = 5000000
    Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
      tf = x.report("for:")   { for i in 1..n; a = "1"; end }
      tt = x.report("times:") { n.times do   ; a = "1"; end }
      tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
      [tf+tt+tu, (tf+tt+tu)/3]
    end

Generates:

                  user     system      total        real
    for:      0.970000   0.000000   0.970000 (  0.970493)
    times:    0.990000   0.000000   0.990000 (  0.989542)
    upto:     0.970000   0.000000   0.970000 (  0.972854)
    >total:   2.930000   0.000000   2.930000 (  2.932889)
    >avg:     0.976667   0.000000   0.976667 (  0.977630)
## bm(label_width 0, *labels , &blk ) [](#method-c-bm)
A simple interface to the #benchmark method, #bm generates sequential reports
with labels. `label_width` and `labels` parameters have the same meaning as
for #benchmark.

    require 'benchmark'

    n = 5000000
    Benchmark.bm(7) do |x|
      x.report("for:")   { for i in 1..n; a = "1"; end }
      x.report("times:") { n.times do   ; a = "1"; end }
      x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
    end

Generates:

                  user     system      total        real
    for:      0.960000   0.000000   0.960000 (  0.957966)
    times:    0.960000   0.000000   0.960000 (  0.960423)
    upto:     0.950000   0.000000   0.950000 (  0.954864)
## bmbm(width 0) [](#method-c-bmbm)
Sometimes benchmark results are skewed because code executed earlier
encounters different garbage collection overheads than that run later. #bmbm
attempts to minimize this effect by running the tests twice, the first time as
a rehearsal in order to get the runtime environment stable, the second time
for real. GC.start is executed before the start of each of the real timings;
the cost of this is not included in the timings. In reality, though, there's
only so much that #bmbm can do, and the results are not guaranteed to be
isolated from garbage collection and other effects.

Because #bmbm takes two passes through the tests, it can calculate the
required label width.

    require 'benchmark'

    array = (1..1000000).map { rand }

    Benchmark.bmbm do |x|
      x.report("sort!") { array.dup.sort! }
      x.report("sort")  { array.dup.sort  }
    end

Generates:

    Rehearsal -----------------------------------------
    sort!   1.440000   0.010000   1.450000 (  1.446833)
    sort    1.440000   0.000000   1.440000 (  1.448257)
    -------------------------------- total: 2.890000sec

                user     system      total        real
    sort!   1.460000   0.000000   1.460000 (  1.458065)
    sort    1.450000   0.000000   1.450000 (  1.455963)

#bmbm yields a Benchmark::Job object and returns an array of Benchmark::Tms
objects.
## measure(label "") [](#method-c-measure)
Returns the time used to execute the given block as a Benchmark::Tms object.
Takes `label` option.

    require 'benchmark'

    n = 1000000

    time = Benchmark.measure do
      n.times { a = "1" }
    end
    puts time

Generates:

    0.220000   0.000000   0.220000 (  0.227313)
## realtime() [](#method-c-realtime)
Returns the elapsed real time used to execute the given block. The unit of
time is seconds.

    Benchmark.realtime { "a" * 1_000_000_000 }
    #=> 0.5098029999935534

