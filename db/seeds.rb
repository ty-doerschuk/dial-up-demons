@baby_questions = []
@baby_answers = []
@baby_comments = []

10.times {
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, hashed_password: "1")
  @baby_questions << Question.new(title: Faker::Hacker.say_something_smart, text: Faker::Hacker.say_something_smart)
  @baby_answers << Answer.new(text: Faker::Company.catch_phrase)
  @baby_comments << Comment.new(text: Faker::Company.bs)
}

@baby_comments.each do |c|
  c.author = User.find_by(id: (1..10).to_a.sample)
  c.save!
end

@baby_questions.each do |q|
  q.author = User.find_by(id: (1..10).to_a.sample)
  q.comments << Comment.find_by(id: (1..10).to_a.sample)
  q.save!
end

@baby_answers.each do |a|
  a.author = User.find_by(id: (1..10).to_a.sample)
  a.question = Question.find_by(id: (1..10).to_a.sample)
  a.comments << Comment.find_by(id: (1..10).to_a.sample)
  a.save!
end

