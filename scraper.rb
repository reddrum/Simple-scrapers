
require 'curb'
require 'nokogiri'

http = Curl.get("http://www.nytimes.com/") do |http|
  http.headers['User-Agent'] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36"
end

html = Nokogiri::HTML(http.body_str)
html.css(".a-column column").each do |node|
  sections_html = Nokogiri::HTML(node.inner_html)
  sections_html.css(".first-column-region region dycontent dyMonitor").each do |node|
    title = node.css(".story-heading").text
    puts title, "\n\n"
  end
end