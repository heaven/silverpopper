# Set of methods that are used by both XMLAPI and Transact API
module Silverpopper::Common

  # Dispatch an API call to the given url, with content headers
  # set appropriately.  Raise unless successful and return the 
  # raw response body
  def send_request(markup, url)
    resp = HTTParty.post(url, :body => markup, :headers => {'Content-type' => 'text/xml;charset=UTF-8'})
    raise "Request Failed" unless resp.code == 200 || resp.code == 201

    return resp.body
  end

end
