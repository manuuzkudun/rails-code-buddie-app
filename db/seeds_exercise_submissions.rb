ExerciseSubmission.create(completed: true, user_id: 1, exercise_id: 1, answer: "class HelloWorld
  def self.hello
    'Hello, World!'
  end
end")

ExerciseSubmission.create(completed: true, user_id: 3, exercise_id: 2, answer: " class HelloWorld
    chars1 = strand1.chars

    chars2 = strand2.chars

    count = 0

    chars1.each_with_index do |char, index|

      count += 1 if char != chars2[index]

    end

    return count
")

ExerciseSubmission.create(completed: true, user_id: 2, exercise_id: 2, answer:"     chars1 = strand1.chars
    count = 0

    chars2 = strand2.chars


    chars1.each_with_index do |char, index|

      count += 1 if char != chars2[index]

    end

    return count")



