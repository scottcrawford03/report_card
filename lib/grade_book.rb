class GradeBook
  attr_reader :grades         # => nil
  def initialize
    @grades = self.load_data

  end

  def self.load_data
    [
      { student_name: 'Alice Smith', subject: 'Biology', grade: 72 },
      { student_name: 'Alice Smith', subject: 'Biology', grade: 89 },
      { student_name: 'Alice Smith', subject: 'Creative Writing', grade: 92 },
      { student_name: 'Bob Smith', subject: 'Creative Writing', grade: 94 },
      { student_name: 'Cindy Johnson', subject: 'Video and Media Technology', grade: 86 }
    ].map { |row| Student.new(row)  }
  end

  def self.grades
    @grades ||= self.load_data
  end

  def self.all_of_grades(student)
    grades.find_all { |row| row.student_name == student }
  end

  def self.grades_by_class(subject, student=nil)
    class_grades = grades.find_all { |row| row.subject == subject }
    class_grades.find_all { |row| row.student_name == student } if student
  end

  def self.sort_grades(student)
    self.all_of_grades(student).sort { |a,b| b.grade <=> a.grade }
  end

end
