require 'open-uri'
require 'nokogiri'

html_file = open("http://www.exercism.io/languages/ruby/exercises")
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.available_exercises_listing li a').each do |element|
  title = element.text
  ruby = Language.find_by_name("Ruby")
  ruby.exercises.create(title: title, description: "")
  #title = title.split(' ').join('-').downcase
  #html_file = open("http://www.exercism.io/exercises/ruby/#{title}/readme")
  #html_doc = Nokogiri::HTML(html_file)
  #html_doc.search('.container').each do |element|
    #p element.text

  #end
end

#ruby = Language.find_by_name("Ruby")
#ruby.exercises.create(title: "Hello World", description: "The classical introductory exercise. Just say \"Hello, World!\"", instruction: "The classical introductory exercise. Just say \"Hello, World!\"



