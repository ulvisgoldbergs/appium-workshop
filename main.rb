require_relative 'Runner/parallel_runner'
require_relative 'Runner/optparser'

options = Optparse.parse(ARGV)

p_runner = ParallelRunner.new(options)
p_runner.run_parallel
p_runner.wait_for_tests