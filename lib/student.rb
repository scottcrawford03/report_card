class Student
  attr_reader :student_name, :subject, :grade
  def initialize(name)
    @student_name = name[:student_name]
    @subject      = name[:subject]
    @grade        = name[:grade]
  end

end
