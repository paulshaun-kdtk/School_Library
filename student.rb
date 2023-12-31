class Student < Person
  attr_accessor :classroom

  def initialize(age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = nil
  end

  def assign_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
