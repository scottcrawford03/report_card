gem 'minitest', '~> 5.2'               # => true
require 'minitest/autorun'             # => true
require 'minitest/pride'               # => true
require_relative '../lib/grade_book'   # => true
require_relative '../lib/student'      # => true
require_relative '../lib/report_card'  # => true

class IntegrationTest < Minitest::Test
  def test_that_it_finds_grades_for_student
    report_card = ReportCard.new("Alice Smith")  # => #<ReportCard:0x007fc15298b348 @student="Alice Smith">

    all_grades = report_card.show_grades                  # => ["Creative Writing...92", "Biology............89", "Biology............72"]
    biology_grades = report_card.show_subject("Biology")  # => ["Alice Smith...72", "Alice Smith...89"]

    biology_grades.join("\n")                             # => "Alice Smith...72\nAlice Smith...89"


  end

end

# >> Run options: --seed 39617
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.004889s, 204.5408 runs/s, 0.0000 assertions/s.
# >>
# >> 1 runs, 0 assertions, 0 failures, 0 errors, 0 skips
