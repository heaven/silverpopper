# The silverpop client to initialize and make XMLAPI or Transact API requests
# through.  Handles authentication, and many silverpop commands.
class Silverpopper::Client
  include Silverpopper::TransferApi
  include Silverpopper::TransactApi
  include Silverpopper::XmlApi
  include Silverpopper::Common

  # User names to log into silverpop with
  attr_reader :api_username, :ftp_username

  # pod to use, this should be a number and is used to build the url
  # to make api calls to
  attr_reader :pod

  # Silverpop urls
  attr_reader :api_url, :transact_url, :transfer_url

  # Silverpop FTP client
  attr_reader :ftp

  # Cached remote contact lists
  attr_accessor :cached_lists

  # Initialize a Silverpopper Client
  #
  # expects a hash with string keys: 'api_username', 'api_password', 'pod'.
  # pod argument is defaulted to 5
  def initialize(options={})
    @api_username = options[:api_username]
    @api_password = options[:api_password]
    @ftp_username = options[:ftp_username] || options[:api_username]
    @ftp_password = options[:ftp_password] || options[:api_password]
    @pod          = options[:pod]          || 5
    @api_url      = options[:api_url]      || "http://api#{@pod}.silverpop.com"
    @transact_url = options[:transact_url] || "http://transact#{@pod}.silverpop.com"
    @transfer_url = options[:transfer_url] || "transfer#{@pod}.silverpop.com"
    @ftp          = Net::FTP.new
    @cached_lists = []
  end

  protected
  # Passwords to use to log into silverpop with
  attr_reader :api_password, :ftp_password
end
