gem 'minitest', '~> 5.2'               # => true
require 'minitest/autorun'             # => true
require 'minitest/pride'               # => true
require_relative '../lib/grade_book'   # => true
require_relative '../lib/student'      # => true
require_relative '../lib/report_card'  # => true

class IntegrationTest < Minitest::Test
  def test_that_it_finds_grades_for_student
    report_card = ReportCard.new("Alice Smith")  # => #<ReportCard:0x007fbf7b17bb68 @student="Alice Smith">

    all_grades = report_card.show_grades                  # => ["Creative Writing...92", "Biology............89", "Biology............72"]
    biology_grades = report_card.show_subject("Biology")  # => ["Alice Smith...72", "Alice Smith...89"]

    assert_equal "Alice Smith", report_card.student  # => true
    report_card.average_grades("Biology")


  end

end

# >> Run options: --seed 55400
# >>
# >> # Running:
# >>
# >> [41m[37mE[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001088s, 919.1176 runs/s, 919.1176 assertions/s.
# >>
# >>   1) Error:
# >> IntegrationTest#test_that_it_finds_grades_for_student:
# >> NoMethodError: undefined method `average_grades' for #<ReportCard:0x007fbf7b17bb68 @student="Alice Smith">
# >>     /Users/scottcrawford/Turing/csv-practice/csv-exercises/level-i/report_card/test/integration_test.rb:16:in `test_that_it_finds_grades_for_student'
# >>
# >> 1 runs, 1 assertions, 0 failures, 1 errors, 0 skips
