require 'optparse'

module S3Copy
  class CommandLine
    attr_accessor :in_key, :in_secret, :in_bucket, :out_key, :out_secret, :out_bucket, :all

    def initialize(args)
      # Handle options
      options = {}
      @option_parser = OptionParser.new do |opts|
        opts.banner = "Usage: #{opts.program_name} [options]"
        opts.separator ""
        opts.separator "Specific options:"

        # in key
        opts.on(:REQUIRED,"--in_key S3KEY","The S3 amazon key to use for the in bucket.") do |val|
          @in_key = val
        end
        
        # in secret
        opts.on(:REQUIRED,"--in_secret S3SECRET","The S3 amazon secret to use for the in bucket.") do |val|
          @in_secret = val
        end
        
        # in bucket
        opts.on(:REQUIRED,"--in_bucket BUCKET","The name of the bucket to copy from.") do |val|
          @in_bucket = val
        end

        # out key
        opts.on(:REQUIRED,"--out_key S3KEY","The S3 amazon key to use for the out bucket.") do |val|
          @out_key = val
        end
        
        # out secret
        opts.on(:REQUIRED,"--out_secret S3SECRET","The S3 amazon secret to use for the out bucket.") do |val|
          @out_secret = val
        end
        
        # out bucket
        opts.on(:REQUIRED,"--out_bucket BUCKET","The name of the bucket to copy to.") do |val|
          @out_bucket = val
        end
        
        # all files
        opts.on(:OPTIONAL,"--all","Copy all of the files. If this is omitted filenames will be read from STDIN.") do |val|
          @all = val
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
      return (@in_key.nil? or @in_secret.nil? or @in_bucket.nil? or @out_bucket.nil?)
    end

  end
end
