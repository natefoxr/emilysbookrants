module ApplicationHelper

  require 'net/http'

  def gravatar?(email)
    gravatar_check = "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.code.to_i != 404 # from d=404 parameter
  end

  def gravatar_for(user, options = { size: 100 })
    email_address = user.email.downcase
    size = options[:size]
    if email_address.to_s == "eabuhajleh@outlook.com"
      image_tag("cover.jpg", alt: user.username, class: "rounded-circle shadow mx-auto d-block", style: "width: #{size}px; height: #{size}px")
    elsif !gravatar?(email_address)
      image_tag("user.png", alt: user.username, class: "rounded-circle shadow mx-auto d-block p-2", style: "width: #{size}px; height: #{size}px")
    else
      hash = Digest::MD5.hexdigest(email_address)
      gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
      image_tag(gravatar_url, alt: user.username, class: "rounded-circle shadow mx-auto d-block")
    end
  end

end
