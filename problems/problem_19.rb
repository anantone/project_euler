# Number of Sundays that fall on the 1st of the months during start and end year
# (inclusive)
class SundayCount

  KNOWN_DAY = {'1 Jan 1900' => 'Monday'}

  DAYS = {1 => 'Monday',
          2 => 'Tuesday',
          3 => 'Wednesday',
          4 => 'Thursday',
          5 => 'Friday',
          6 => 'Saturday',
          7 => 'Sunday'}

  private

  attr_accessor :start_year, :end_year

  def initialize(start_year, end_year)
    self.start_year = start_year
    self.end_year = end_year
  end

  def leap? year
    (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?
  end

  def total_days
    (start_year..end_year).sum { |year| leap?(year) ? 366 : 365 }
  end

  def first_day
    DAYS[((1900...start_year).sum { |year| leap?(year) ? 366 : 365 }) % 7 + 1]
  end

  def sundays
    (0...total_days).select { |day| day % 7 == DAYS.key('Sunday') - DAYS.key(first_day) }
  end

  def firsts_of_month
    n = -31
    (start_year..end_year).each_with_object([]) do |year, firsts|
      a = n + 31
      firsts.push(a)
      b = a + 31
      firsts.push(b)
      c = leap?(year) ? b + 29 : b + 28
      firsts.push(c)
      d = c + 31
      firsts.push(d)
      e = d + 30
      firsts.push(e)
      f = e + 31
      firsts.push(f)
      i = f + 30
      firsts.push(i)
      j = i + 31
      firsts.push(j)
      k = j + 31
      firsts.push(k)
      l = k + 30
      firsts.push(l)
      m = l + 31
      firsts.push(m)
      n = m + 30
      firsts.push(n)
    end
  end

  public

  def sunday_the_first
    sundays.intersection(firsts_of_month).length
  end

end
