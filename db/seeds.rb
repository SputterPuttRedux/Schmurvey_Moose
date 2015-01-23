require 'faker'

# seed users
10.times do
  User.create(
    name: Faker::Name.name,
    password: 'a'
    )
end

# seed user answers
100.times do
  UserAnswer.create(user_id: rand(1..10), answer_id: rand(1..50))
end

# seed surveys

10.times do
  Survey.create(
    title: Faker::Lorem.sentence,
    user_id: rand(1..10)
    )
end

# seed questions
surveys = Survey.all
surveys.each do |survey|
  5.times do
    survey.questions << Question.create(description: Faker::Lorem.sentence)
  end
end

# seed answers
questions = Question.all
questions.each do |question|
    4.times do
      question.answers << Answer.create(description: Faker::Lorem.word)
    end
end
