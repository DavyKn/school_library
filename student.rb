require_relative('person')

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    update_classroom(@classroom)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def update_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
