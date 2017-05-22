user = User.new(first_name: 'Ivan', last_name: 'Munguia', maiden_name: 'Cruz', email: 'ivanalejandro249@gmail.com', password: 'password', password_confirmation: 'password')
user.skip_confirmation!
user.save!

group = user.groups.create(name: "2101", subject: "Base de datos", begin_date: "2016-02-01", end_date: "2016-05-27", classdays_attributes: [
	{day: "Lunes", begin_time: "08:00", end_time: "10:00"},
	{day: "Miércoles", begin_time: "10:00", end_time: "12:00"},
	{day: "Viernes", begin_time: "12:00", end_time: "14:00"}
])

# group.classdays.create(day: "Lunes", begin_time: "08:00", end_time: "10:00")
# group.classdays.create(day: "Miércoles", begin_time: "10:00", end_time: "12:00")
# group.classdays.create(day: "Viernes", begin_time: "12:00", end_time: "14:00")

group.generate_calendar!

#
# begin_date = Date.parse("2016-02-01")
# end_date   = Date.parse("2016-05-27")
# counter = 0
#
# while((current_date = begin_date + counter) <= end_date)
#   group.add_class_to_day(CourseClass.new(date: current_date.to_s))
#   counter += 1
# end
#
10.times do |i|
  str = i.to_s.rjust(2, "0")
  student = Student.new(account_number: "3#{str}306064", last_name: Faker::Name.last_name, maiden_name: Faker::Name.last_name, first_name: Faker::Name.first_name)
  group.students << student
end

# monday.course_classes.create(date: "2016-02-01")
# monday.course_classes.create(date: "2016-02-08")
# monday.course_classes.create(date: "2016-02-15")
# monday.course_classes.create(date: "2016-02-22")
# monday.course_classes.create(date: "2016-02-29")
# monday.course_classes.create(date: "2016-03-07")
# monday.course_classes.create(date: "2016-03-14")
# monday.course_classes.create(date: "2016-03-21")
# monday.course_classes.create(date: "2016-03-28")
# monday.course_classes.create(date: "2016-04-04")
# monday.course_classes.create(date: "2016-04-11")
# monday.course_classes.create(date: "2016-04-18")
# monday.course_classes.create(date: "2016-04-25")
# monday.course_classes.create(date: "2016-05-02")
# monday.course_classes.create(date: "2016-05-09")
# monday.course_classes.create(date: "2016-05-16")
# monday.course_classes.create(date: "2016-05-23")


# friday.course_classes.create(date: "2016-02-05")
# friday.course_classes.create(date: "2016-02-12")
# friday.course_classes.create(date: "2016-02-19")
# friday.course_classes.create(date: "2016-02-26")
# friday.course_classes.create(date: "2016-03-04")
# friday.course_classes.create(date: "2016-03-11")
# friday.course_classes.create(date: "2016-03-18")
# friday.course_classes.create(date: "2016-03-25")
# friday.course_classes.create(date: "2016-04-1")
# friday.course_classes.create(date: "2016-04-08")
# friday.course_classes.create(date: "2016-04-15")
# friday.course_classes.create(date: "2016-04-22")
# friday.course_classes.create(date: "2016-04-29")
# friday.course_classes.create(date: "2016-05-06")
# friday.course_classes.create(date: "2016-05-13")
# friday.course_classes.create(date: "2016-05-20")
# friday.course_classes.create(date: "2016-05-27")
