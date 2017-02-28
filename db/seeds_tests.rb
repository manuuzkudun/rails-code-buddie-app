require 'open-uri'
require 'nokogiri'

exercises = Exercise.all

# iterates through exercises
exercises.each do |exercise|
  url = "http://www.exercism.io/exercises/#{exercise.language.name.downcase}/#{exercise.title.parameterize}/test-suite"
  html_file = open(url)
  html_doc = Nokogiri::HTML(html_file)
 # uses interpolation to define class name from language
  test_file_selector = "div.highlight.#{exercise.language.name.parameterize} td.code"
  html_doc.search(test_file_selector).each do |test_file|
    exercise.exercise_files.create(content: test_file.text.remove("skip"), file_type: "Test File")
  end
end
