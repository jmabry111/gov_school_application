# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create!(name: "Bassett High School")
School.create!(name: "Magna Vista High School")
School.create!(name: "Martinsville High School")
School.create!(name: "George Washington High School")
School.create!(name: "Galileo High School")
School.create!(name: "Tunstall High School")
School.create!(name: "Chatham High School")
School.create!(name: "Dan River High School")
School.create!(name: "Gretna High School")

User.create!(email: "jmabry@mymabry.com", name: "Jason Mabry", admin: true)
#User.create!(email: "syralux@henry.k12.va.us", name: "Shekila Yralux", admin: false, school: 1)
#User.create!(email: "kcecil@henry.k12.va.us", name: "Karen Cecil", admin: false, school: 2)
#User.create!(email: "dave.cochran@mail.dps.k12.va.us", name: "Dave Cochran", admin: false)
#User.create!(email: "mperry@martinsville.k12.va.us", name: "", admin: false)

