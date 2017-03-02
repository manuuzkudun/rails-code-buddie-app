exercise_comment = ExerciseComment.new(content: "This exercise helped me understand the concept")

user_ids = [1,2]

user_ids.each do |id|
  ExerciseComment.create(content: Faker::Lorem.sentence, user_id: id, exercise_id: 1)
end

#exercise_comment = ExerciseComment.new(content: Faker::Lorem.sentence, user_id: 1, exercise_id: 1)
