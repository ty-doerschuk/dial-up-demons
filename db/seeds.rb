steve = User.new(username: "Steve Jobs", email: "boss-man@apple.com", password: "password", status: "dead")
richard = User.new(username: "Richard Stallman", email: "free@aol.com", password: "password", status: "free")
guido = User.new(username: "Guido van Rossum", email: "bdfl@dropbox.com", password: "password", status: "python")
brendan = User.new(username: "Brendan Eich", email: "mozilla@mozilla.com", password: "password", status: "javascript")
matz = User.new(username: "Yukihiro Matsumoto", email: "matz@ruby.com", password: "password", status: "ruby")
heatha = User.new(username: "Heatha", email: "heatha@aol.com", password: "password", status: "tired")
ty = User.new(username: "ty", email: "ty", password: "ty", status: "pissed off")
joe = User.new(username: "joe", email: "joe", password: "password")
luis = User.new(username: "luis", email: "luis", password: "password")

steve.save
richard.save
guido.save
brendan.save
matz.save
heatha.save
ty.save
joe.save
luis.save

color_screen = Question.new(title: "Color notebook or not worth the money?", 
  text: "I'm thinking about getting the new Apple PowerBook 165c with the color screen. Should I spend the money or stick with grayscale?")
color_screen.author = heatha
color_screen.save


answer_1 = Answer.new(text: "What a stupid question. The entire world is in color. Of course you should spend the $3,400.", author: steve, question: color_screen)
answer_1.save

free_data = Question.new(title: "Is it REALLY free data?", 
  text: "I keep getting these disks from AOL advertising 1000 hours of free data. Is this just a scam or should I check it out?")
free_data.author = ty
free_data.save
answer_2 = Answer.new(text: "It's a total scam. Nobody gives away anything for free.",
  author: steve, 
  question: free_data)
answer_2.save

comment_1 = Comment.create(
  text: "That is so cynical. Some of us believe in free access to information.", 
  author: richard,
  commentable_type: "Answer",
  commentable_id: answer_2.id)

answer_3 = Answer.new(text: "I recommend all the ethical distros - namely, those that are 100% free software.", 
  author: richard,
  question: free_data)
answer_3.save



perfect_language = Question.new(title: "Want to learn a programming language",
  text: "wondering where I should start....")
perfect_language.author = heatha
perfect_language.save

answer_4 = Answer.new(text: "AppleScript. Obviously",
  author: steve,
  question: perfect_language)
answer_4.save

answer_5 = Answer.new(text: "No language can be perfect for everyone. I tried to make Ruby perfect for me, but maybe it's not perfect for you. The perfect language for Guido van Rossum is probably Python.",
  author: matz, 
  question: perfect_language)

comment_2 = Comment.create(
  text: "That's perfectly true.",
  author: guido,
  commentable_type: "Answer",
  commentable_id: answer_5.id)

floppy_disk = Question.new(title: "Why do we still call them floppy?",
  text: "These new 3 1/2-inch discs are NOT floppy")
floppy_disk.author = joe
floppy_disk.save


# +++++++++++++++++++++++++++
# @baby_questions = []
# @baby_answers = []
# @baby_comments = []
# @baby_comments2 = []

# 10.times {
#   User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, hashed_password: "1")
#   @baby_questions << Question.new(title: Faker::Hacker.say_something_smart, text: Faker::Hacker.say_something_smart)
#   @baby_answers << Answer.new(text: Faker::Company.catch_phrase)
#   @baby_comments << Comment.new(text: Faker::Company.bs)
#   @baby_comments2 << Comment.new(text: Faker::Company.bs)
# }

# @baby_comments.each do |c|
#   c.author = User.find_by(id: (1..10).to_a.sample)
#   c.save!
# end

# @baby_comments2.each do |c|
#   c.author = User.find_by(id: (1..10).to_a.sample)
#   c.save!
# end

# count = 1

# @baby_questions.each do |q|
#   q.author = User.find_by(id: (1..10).to_a.sample)
#   q.comments << Comment.find(count)
#   count += 1
#   q.save!
# end

# @baby_answers.each do |a|
#   a.author = User.find_by(id: (1..10).to_a.sample)
#   a.question = Question.find_by(id: (1..10).to_a.sample)
#   a.comments << Comment.find(count)
#   count += 1
#   a.save!
# end