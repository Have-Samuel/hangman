require 'benchmark'

str = "  When it comes to performance, both strip, lstrip, and rstrip are relatively fast. To compare the performance of these methods, we can run a benchmark test using the Ruby benchmark library. Here's an example:  "

Benchmark.bm do |x|
  x.report('strip:') { 100_000.times { str.strip } }
  x.report('lstrip:') { 100_000.times { str.lstrip } }
  x.report('rstrip:') { 100_000.times { str.rstrip } }
end
