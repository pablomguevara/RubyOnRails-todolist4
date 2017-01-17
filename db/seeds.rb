# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    # * The four users below with their birth years:
    #     - Carly Fiorina, 1954
    #     - Donald Trump, 1946
    #     - Ben Carson, 1951
    #     - Hillary Clinton, 1947
    # * Usernames (e.g., their last names) and a password for each `User` 
    # * A `Profile` for each `User`
    # * Exactly one `TodoList` per `User` that is due one year from the date the database is loaded 
    #     - (hint: `Date.today` provides today's date and `1.year` can be used to define one year)
    # * Each `TodoList` contains five (5) `TodoItems` (there must be 20 total) 
    # * Each `TodoItem` having a due date of one year from the time the database is loaded  
    # * Each `TodoItem` must have an arbitrary `title` and `description`s
  
    # (Hint: you may want to consider using loops)


User.destroy_all
User.create! [
    {username: "Fiorina", password_digest: 1954},
    {username: "Trump", password_digest: 1946},
    {username: "Carson", password_digest: 1951},
    {username: "Clinton", password_digest: 1947}
]

# carly = User.find_by(username: "Carly Fiorina")
# donald = User.find_by(username: "Donald Trump")
# ben = User.find_by(username: "Ben Carson")
# hilary = User.find_by(username: "Hillary Clinton")

User.find_by(username: "Fiorina").create_profile(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina")
User.find_by(username: "Trump").create_profile(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump")
User.find_by(username: "Carson").create_profile(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson")
User.find_by(username: "Clinton").create_profile(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton")

# carly.create_profile(gender: "F", birth_year: "1954", first_name: "Carly", last_name: "Fiorina")
# donald.create_profile(gender: "M", birth_year: "1946", first_name: "Donald", last_name: "Trump")
# ben.create_profile(gender: "M", birth_year: "1951", first_name: "Ben", last_name: "Carson")
# hilary.create_profile(gender: "F", birth_year: "1947", first_name: "Hillary", last_name: "Clinton")

newdate = Date.today + 1.year

User.all.each { |user|
    user.todo_lists.create! [{
  	  list_name: "#{user.username.split[0]}'s List",
  	  list_due_date: newdate
  	}]
}

TodoList.all.each { |list|
	5.times { |i|
		list.todo_items.create! [{
			due_date: newdate,
			title: "#{list.list_name} - task number #{i+1}",
			description: "#{list.list_name.split('\'')[0]} please complete this tastk (task id #{i+1})",
			completed: false
		}]
    }
}









