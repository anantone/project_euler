KNOWN_DAY = {'1 Jan 1900' => 'Monday'}

DAYS = {1 => 'Monday',
        2 => 'Tuesday',
        3 => 'Wednesday',
        4 => 'Thursday',
        5 => 'Friday',
        6 => 'Saturday',
        7 => 'Sunday'}

def main()


def total_days(start_year, end_year):
    total_days = 0
    for year in range(start_year, end_year + 1):
        total_days += 366 if leap(year) else 365
    return total_days

def leap(year):
    return year % 4 == 0 and year % 100 != 0 or year % 400 == 0
