require 'open-uri'
require 'nokogiri'

languages = ['Javascript', 'PHP', 'Python', 'Ruby']

languages.each do |language|
  Language.create(name: language, icon: "language_icons/#{language.downcase}.png")
end







