=begin

Typically meetups happen on the same day of the week.

Examples are

the first Monday
the third Tuesday
the Wednesteenth
the last Thursday

Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a meetup whose members realised that there are exactly 7 days that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.

Write code that calculates date of meetups.

Use test suite in meetup_test.rb

=end

class Meetup
  ORDER = [:first, :second, :third, :fourth]
  
  def initialize(month, year)
    @date = Time.new(year, month)
    @year = year
    @month = month
  end
  
  def day(weekday, schedule)
    days = find_days(weekday)
    meet_day = correct_day(days, schedule)
    Date.new(year, month, meet_day)
  end
  
  protected
  
  attr_reader :year, :month
  attr_accessor :date
  
  def find_days(weekday)
    wday = weekday.to_s + '?'
    days = []
    one_day = 60 * 60 * 24
    current_month = date.month
    while date.month == current_month
      days << date.day if date.send(wday)
      self.date += one_day
    end
    days
  end
  
  def correct_day(days, schedule)
    case schedule
    when :teenth
      days.select { |num| num.between?(13, 19) }.first
    when :last
      days.last
    else
      days[ORDER.index(schedule)]
    end
  end
end