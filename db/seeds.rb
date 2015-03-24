# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Professor.create({name: 'Jillian Morrison'}, without_protection: true)
Professor.create({name: 'Peter Erdos'}, without_protection: true)
Professor.create({name: 'Arthi Gupta'}, without_protection: true)
Professor.create({name: 'William Yin'}, without_protection: true)

Subject.create({name: 'Physics'}, without_protection: true)
Subject.create({name: 'English Literature'}, without_protection: true)
Subject.create({name: 'American History'}, without_protection: true)
Subject.create({name: 'Computer Science'}, without_protection: true)
Subject.create({name: 'Economics'}, without_protection: true)

ProfessorsSubject.create({professor_id: 1, subject_id: 4}, without_protection: true)
ProfessorsSubject.create({professor_id: 2, subject_id: 1}, without_protection: true)
ProfessorsSubject.create({professor_id: 2, subject_id: 2}, without_protection: true)
ProfessorsSubject.create({professor_id: 3, subject_id: 3}, without_protection: true)
ProfessorsSubject.create({professor_id: 3, subject_id: 4}, without_protection: true)