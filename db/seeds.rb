brian = User.create!(username: "bsheridan12", email: "bsheridan12@gmail.com", password: "test")
shiraz = User.create!(username: "pacoguy", email: "pacoguy@gmail.com", password: "test")
miriam = User.create!(username: "mmdesign007", email: "mmdesign007@gmail.com", password: "test")

animal_survey = Survey.create(title: "Best Animals", description: "Chose which animal is better!", creator: brian)
superhero_survey = Survey.create(title: "Super Heroes", description: "Chose which Super Hero is better!", creator: shiraz)
food_survey = Survey.create(title: "Favourite Foods", description: "Chose which Food is better!", creator: miriam)

# ----------------- Survey 1 ------------------------
Question.create(ask: "Dogs or Cats?", survey: animal_survey)
Question.create(ask: "Komodo Dragons or Aligators?", survey: animal_survey)
Question.create(ask: "Honey Badgers or Lions?", survey: animal_survey)

Choice.create(decision: "Dogs", question_id: 1)
Choice.create(decision: "Cats", question_id: 1)

Choice.create(decision: "Komodo Dragons", question_id: 2)
Choice.create(decision: "Aligators", question_id: 2)

Choice.create(decision: "Honey Badgers", question_id: 3)
Choice.create(decision: "Honey Badgers", question_id: 3)

Response.create(choice_id: 1, voter: shiraz)
Response.create(choice_id: 2, voter: shiraz)
Response.create(choice_id: 6, voter: shiraz)


# ----------------- Survey 2 ------------------------


Question.create(ask: "Marvel or DC?", survey: superhero_survey)
Question.create(ask: "The Flash or AquaMan?", survey: superhero_survey)
Question.create(ask: "Batman or Green Lantern?", survey: superhero_survey)

Choice.create(decision: "Marvel", question_id: 4)
Choice.create(decision: "DC", question_id: 4)

Choice.create(decision: "The Flash", question_id: 5)
Choice.create(decision: "AquaMan", question_id: 5)

Choice.create(decision: "Batman", question_id: 6)
Choice.create(decision: "Green Lantern", question_id: 6)

Response.create(choice_id: 8, voter: miriam)
Response.create(choice_id: 9, voter: miriam)
Response.create(choice_id: 11, voter: miriam)


# ----------------- Survey 3 ------------------------

Question.create(ask: "Alfredo or Spaghetti", survey: food_survey)
Question.create(ask: "Pizza or Hamburgers", survey: food_survey)
Question.create(ask: "Spinich or Kale", survey: food_survey)

Choice.create(decision: "Alfredo", question_id: 7)
Choice.create(decision: "Spaghetti", question_id: 7)

Choice.create(decision: "Pizza", question_id: 8)
Choice.create(decision: "Hamburgers", question_id: 8)

Choice.create(decision: "Spinich", question_id: 9)
Choice.create(decision: "Kale", question_id: 9)

Response.create(choice_id: 13, voter: brian)
Response.create(choice_id: 16, voter: brian)
Response.create(choice_id: 18, voter: brian)

Response.create(choice_id: 14, voter: shiraz)
Response.create(choice_id: 14, voter: shiraz)
Response.create(choice_id: 17, voter: shiraz)
