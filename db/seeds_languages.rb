require 'open-uri'
require 'nokogiri'


base_url = "http://www.exercism.io/"
url = "http://www.exercism.io/languages"
html_file = open(url)
html_doc = Nokogiri::HTML(html_file)

# gets the language blocks
html_doc.search('a.track_link').each do |language_block|
  name = language_block.search("p").first.text
  if( ["PHP", "Python", "JavaScript", "Ruby"].include?(name))
    filename = language_block.search("img").first.attributes["src"].value
    uri = URI.join( base_url, filename ).to_s

    # creates nested directories for file open
    filePath = "language_icons#{filename}"
    fullPath = Rails.root.join("app", "assets", "images", "language_icons", filename.sub('/', '')).to_s
    dirname = File.dirname(fullPath)
    unless File.directory?(dirname)
      FileUtils.mkdir_p(dirname)
    end

    # writes image from exercism to assests images
    File.open(Rails.root.join("app", "assets", "images", "language_icons", filename.sub('/', '')).to_s,'wb'){ |f| f.write(open(uri).read)}

    Language.create(name: name, icon: filePath)
  end
end








