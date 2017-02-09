require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
class Optparse
  CODES = %w(iso-2022-jp shift_jis euc-jp utf8 binary).freeze
  CODE_ALIASES = { 'jis' => 'iso-2022-jp', 'sjis' => 'shift_jis' }.freeze

  def self.parse(args)
    options = OpenStruct.new
    options.apk = '*.apk'
    options.tags = '--tags ~@wip'
    options.report = 'html'

    opt_parser = OptionParser.new do |opts|
      opts.banner = 'Usage:ruby main.rb [options]'

      opts.separator ''
      opts.separator 'Specific options:'

      opts.on('-a', '--apk [app.apk]',
              'app .apk file, default *.apk') do |apk|
        options.apk = apk
      end

      opts.on('-t', '--tags [@tag]',
                'Tags which tests should execute (@test), default ~@wip') do |t|
                  tags = ''
                  t.split('.').each do |temp_tag|
                    p temp_tag
                    tags = tags + '--tags ' + temp_tag + ' '
                  end
                  options.tags = tags
                end

      opts.on('-r', '--report [html]',
              'Report file format, default html') do |report|
                options.report = report
              end

      opts.separator ''
      opts.separator 'Common options:'
      opts.on_tail('-h', '--help', 'Show this message') do
        puts opts
        exit
      end
    end

    opt_parser.parse!(args)
    options
  end
end
