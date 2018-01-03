require_relative 'Runner/parallel_runner'
require_relative 'Runner/optparser'
p_runner = ParallelRunner.new(Optparser.parse(ARGV))
# p_runner = ParallelRunner.new({'apk' => 'app.apk', 'report' => 'html'})
p_runner.run_parallel
p_runner.wait_for_all_tests
