# require 'open-uri'
# require 'nokogiri'

# html_file = open("http://www.exercism.io/languages/ruby/exercises")
# html_doc = Nokogiri::HTML(html_file)


# html_doc.search('.available_exercises_listing li').each do |element|
#   title = element.search('a')[0].text
#   description = element.search('.tagline')[0].text
#   ruby = Language.find_by_name("Ruby")
#   ruby.exercises.create(title: title, description: description)
# end

# Julia's suggested  code
# all i did was wrap Fred's scrapper in a for each to get all the exercises based off the language
require 'open-uri'
require 'nokogiri'

languages = Language.all
# iterorates through all languages in the database
languages.each do |language|
  url = "http://www.exercism.io/languages/#{language.name.parameterize}/exercises"
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.available_exercises_listing li').each do |element|
    title = element.search('a')[0].text
    description = element.search('.tagline')[0].text
    language.exercises.create(title: title, description: description)
  end
end





