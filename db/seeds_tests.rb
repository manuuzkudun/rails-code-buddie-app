# DONE Create a folder with the different test files
# create an array with paths of the exercises ['/exercises/helloworld', 'hff']
#   or get access to the directory

# tests = ['/exercises/hello_world_test.rb', ...]


# loop over the array of paths and then open the file how to read a file in ruby and grab the contents


# :content will be what im reading from the file



# open the files save the contents of the file in a variable content then create actual objects in the content


# we need test file object


# create exercise file objects for test files



tests = ['db/exercises/hello_world_test.rb', 'db/exercises/hamming_test.rb', 'db/exercises/gigasecond_test.rb' ]
tests.each do |test|
  exercise_title = test.split('/')[2].split('.').slice(0).split('_').slice(0...-1).map {|w| w.capitalize}.join(' ')
  exercise = Exercise.find_by(title: exercise_title)
  content = ""
  File.open(test, "r") do |f|
    f.each_line do |line|
      content += line
    end
  end
  ExerciseFile.create(content: content, file_type: 'test', exercise: exercise)
end



