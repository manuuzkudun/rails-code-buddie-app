require 'open-uri'
require 'nokogiri'

languages = ['Javascript', 'PHP', 'Python', 'Ruby']

languages.each do |language|
  if language == 'PHP'
    Language.create(name: language, icon: "language_icons/php-1.png")
  else
    Language.create(name: language, icon: "language_icons/#{language.downcase}.png")
  end
end

