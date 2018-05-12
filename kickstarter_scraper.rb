# require libraries/modules here
require 'nokogiri'
require 'pry'


def create_project_hash
  # write your code here
  projects = {}

  html = File.read('fixtures/kickstarter.html')

  doc = Nokogiri::HTML(html)

  doc.css(".project-card").each do |project|

  img =	project.css("img").attribute("src").value
  title = project.css("h2 strong a").children[0].text
  loca = project.css(".location-name").children[0].text
  percent = project.css(".funded").children.children.text
  desc = project.css(".bbcard_blurb").children.text.strip
  projects["#{title}"] = {
  	:image_link => img,
  	:description => desc,
  	:location => loca,
  	:percent_funded => percent.split("%")[0].to_i
  }
  end
  projects
end