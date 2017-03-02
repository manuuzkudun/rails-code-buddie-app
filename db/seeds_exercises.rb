require_relative "exercises/exercises"

EXERCISES.each do |exercise|
  ex = Exercise.create(
    title: exercise[:title],
    description: exercise[:description],
    language: Language.find_by(name: exercise[:language_name]),
    instruction: exercise[:instruction]
  )
  ExerciseFile.create(
    content: exercise[:initial_code],
    file_type: "initial_code",
    exercise: ex
  )
  ExerciseFile.create(
    content: exercise[:test],
    file_type: "test",
    exercise: ex
  )
end




