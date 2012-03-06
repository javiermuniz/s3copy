require 'granicus-platform-api'
require 'faraday_middleware'
require 'optparse'

module S3Copy
  class CommandLine
    attr_accessor :in_key, :in_secret, :in_bucket, :out_key, :out_secret, :out_bucket

    def initialize(args)
      # Handle options
      options = {}
      @option_parser = OptionParser.new do |opts|
        opts.banner = "Usage: s3copy [options]"
        opts.separator ""
        opts.separator "Specific options:"

        # in key
        opts.on("-ik","--in_key S3KEY","The S3 amazon key to use for the in bucket.") do |user|
          @username = user
        end
        
        # in secret
        opts.on("-is","--in_secret S3SECRET","The S3 amazon secret to use for the in bucket.") do |user|
          @username = user
        end
        
        # in bucket
        opts.on("-ib","--in_bucket BUCKET","The name of the bucket to copy from.") do |host|
          @host = host
        end

        # out key
        opts.on("-ok","--out_key S3KEY","The S3 amazon key to use for the out bucket.") do |user|
          @username = user
        end
        
        # out secret
        opts.on("-os","--out_secret S3SECRET","The S3 amazon secret to use for the out bucket.") do |user|
          @username = user
        end
        
        # out bucket
        opts.on("-ob","--out_bucket BUCKET","The name of the bucket to copy to.") do |host|
          @host = host
        end

        # No argument, shows at tail.  This will print an options summary.
        opts.on_tail("-?", "--help", "Show this message") do
          puts opts
          exit
        end
      end

      # parse options
      @option_parser.parse!(ARGV)
    end

    def show_help
      puts @option_parser
    end

    def missing_arguments?
      return (@in_key.nil? or @in_secret.nil? or @in_bucket.nil? or @out_key.nil? or @out_secret.nil? or @out_bucket.nil?)
    end

  end
end
