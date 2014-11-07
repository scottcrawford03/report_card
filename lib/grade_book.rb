# require_relative '../lib/grade_book'   # => true
require_relative '../lib/student'      # => true
require_relative '../lib/report_card'  # => true

class GradeBook
  attr_reader :grades         # => nil
  def initialize
    @grades = self.load_data

  end

  def self.load_data
    [
      { student_name: 'Alice Smith', subject: 'Biology', grade: 72 },           # => {:student_name=>"Alice Smith", :subject=>"Biology", :grade=>72}
      { student_name: 'Alice Smith', subject: 'Biology', grade: 89 },           # => {:student_name=>"Alice Smith", :subject=>"Biology", :grade=>89}
      { student_name: 'Alice Smith', subject: 'Creative Writing', grade: 92 },  # => {:student_name=>"Alice Smith", :subject=>"Creative Writing", :grade=>92}
      { student_name: 'Bob Smith', subject: 'Biology', grade: 94 },             # => {:student_name=>"Bob Smith", :subject=>"Biology", :grade=>94}
      { student_name: 'Cindy Johnson', subject: 'Biology', grade: 86 }          # => {:student_name=>"Cindy Johnson", :subject=>"Biology", :grade=>86}
    ].map { |row| Student.new(row)  }                                           # => [#<Student:0x007f8d4909a1e0 @student_name="Alice Smith", @subject="Biology", @grade=72>, #<Student:0x007f8d4909a1b8 @student_name="Alice Smith", @subject="Biology", @grade=89>, #<Student:0x007f8d4909a190 @student_name="Alice Smith", @subject="Creative Writing", @grade=92>, #<Student:0x007f8d4909a140 @student_name="Bob Smith", @subject="Biology", @grade=94>, #<Student:0x007f8d4909a118 @student_name="Cindy Johnson", @subject="Biology", @grade=86>]
  end

  def self.grades
    @grades ||= self.load_data  # => [#<Student:0x007f8d4909a1e0 @student_name="Alice Smith", @subject="Biology", @grade=72>, #<Student:0x007f8d4909a1b8 @student_name="Alice Smith", @subject="Biology", @grade=89>, #<Student:0x007f8d4909a190 @student_name="Alice Smith", @subject="Creative Writing", @grade=92>, #<Student:0x007f8d4909a140 @student_name="Bob Smith", @subject="Biology", @grade=94>, #<Student:0x007f8d4909a118 @student_name="Cindy Johnson", @subject="Biology", @grade=86>]
  end

  def self.all_of_grades(student)
    grades.find_all { |row| row.student_name == student }
  end

  def self.grades_by_class(subject)#, student=nil)
    class_grades = grades.find_all { |row| row.subject == subject }  # => [#<Student:0x007f8d4909a1e0 @student_name="Alice Smith", @subject="Biology", @grade=72>, #<Student:0x007f8d4909a1b8 @student_name="Alice Smith", @subject="Biology", @grade=89>, #<Student:0x007f8d4909a140 @student_name="Bob Smith", @subject="Biology", @grade=94>, #<Student:0x007f8d4909a118 @student_name="Cindy Johnson", @subject="Biology", @grade=86>]
    # class_grades.find_all { |row| row.student_name == student } if student  # => nil
  end

  def self.sort_grades(student)
    self.all_of_grades(student).sort { |a,b| b.grade <=> a.grade }
  end

  def self.average_grades(subject_name)
    subject = grades_by_class(subject_name)                                      # => [#<Student:0x007f8d4909a1e0 @student_name="Alice Smith", @subject="Biology", @grade=72>, #<Student:0x007f8d4909a1b8 @student_name="Alice Smith", @subject="Biology", @grade=89>, #<Student:0x007f8d4909a140 @student_name="Bob Smith", @subject="Biology", @grade=94>, #<Student:0x007f8d4909a118 @student_name="Cindy Johnson", @subject="Biology", @grade=86>]
    average_grades = subject.reduce(0) {|sum, n| sum += n.grade }/ subject.size  # => 85
    "#The average grade for #{subject_name} is #{average_grades}"                # => "#The average grade for Biology is 85"
  end

end

  GradeBook.average_grades("Biology")  # => "#The average grade for Biology is 85"
