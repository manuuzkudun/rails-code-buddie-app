ExerciseComment.create(content: "Classic!", user_id: 2, exercise_id: 1)
ExerciseComment.create(content: "Well, what can I say? Took me 10 sec...", user_id: 4, exercise_id: 1)



ExerciseComment.create(content: "This challenge is very easy!", user_id: 1, exercise_id: 2)
ExerciseComment.create(content: "It took me forever!", user_id: 4, exercise_id: 2)

#exercise_comment = ExerciseComment.new(content: Faker::Lorem.sentence, user_id: 1, exercise_id: 1)
