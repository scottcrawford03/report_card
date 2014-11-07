class ReportCard
  def initialize(student)
    @student = student
  end

  def show_grades
    all_grades = GradeBook.sort_grades(@student)
    max_length = all_grades.max_by { |row| row.subject.length }.subject.length + 3
    all_grades.map { |row| "#{row.subject.ljust(max_length, '.')}#{row.grade}" }
  end

  def show_subject(subject)
    subject_grades = GradeBook.grades_by_class(subject, @student)
    max_length = subject_grades.max_by { |row| row.student_name.length }.student_name.length + 3
    subject_grades.map { |row| "#{row.student_name.ljust(max_length, '.')}#{row.grade}"  }
  end
end
