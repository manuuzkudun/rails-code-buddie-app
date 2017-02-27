require 'open-uri'
require 'nokogiri'

html_file = open("http://www.exercism.io/languages/ruby/exercises")
html_doc = Nokogiri::HTML(html_file)


html_doc.search('.available_exercises_listing li').each do |element|
  title = element.search('a')[0].text
  description = element.search('.tagline')[0].text
  ruby = Language.find_by_name("Ruby")
  ruby.exercises.create(title: title, description: description)
  end
