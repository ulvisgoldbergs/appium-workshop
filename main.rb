require_relative 'features/support/parallel_runner'
require_relative 'features/support/optparser'
p_runner = ParallelRunner.new(Optparse.parse(ARGV))
p_runner.run_parallel
p_runner.wait_for_tests
