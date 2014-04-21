# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Idea.destroy_all

Idea.create [{title:"Project 1", category: "Web", user: "Ellie"}, {title: "Project 2", category: "Design", user: "Ellie"}, {title: "Project 3", category: "Tech", user: "Ellie"}, {title: "Project 4", category: "App", user: "Ellie"}, {title: "Project 5", category: "Gaming", user: "Ellie"}, {title: "Project 6", category: "eCommerce", user: "Ellie"}]

User.create [{username: "Ellie"}]

Category.create [{name: "Web"}, {name: "Design"}, {name: "Tech"}, {name: "App"}, {name: "Gaming"}, {name: "eCommerce"}]

