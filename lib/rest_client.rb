require 'net/http'
require 'net/https'

class RestClient
  def initialize(username: nil ,password: nil)
    @username = username
    @password = password
  end

  def get(uri)
    Net::HTTP.start(uri.host, 
                    uri.port,
                    use_ssl: uri.scheme == 'https',   
                    verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth(@username, @password) unless @username.nil? || @password.nil?

      response = http.request(request)
      response.body
    end
  end
end
