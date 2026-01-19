# Gregorian ↔ IFC Conversion Guide (2026)

## Quick Reference: First Day of Each IFC Month in 2026

| IFC Month | IFC Date | Gregorian Date | Day of Week |
| --------- | -------- | -------------- | ----------- |
| January   | Jan 1    | Jan 1, 2026    | Thursday    |
| February  | Feb 1    | Jan 29, 2026   | Thursday    |
| March     | Mar 1    | Feb 26, 2026   | Thursday    |
| April     | Apr 1    | Mar 26, 2026   | Thursday    |
| May       | May 1    | Apr 23, 2026   | Thursday    |
| June      | Jun 1    | May 21, 2026   | Thursday    |
| Sol       | Sol 1    | Jun 18, 2026   | Thursday    |
| July      | Jul 1    | Jul 16, 2026   | Thursday    |
| August    | Aug 1    | Aug 13, 2026   | Thursday    |
| September | Sep 1    | Sep 10, 2026   | Thursday    |
| October   | Oct 1    | Oct 8, 2026    | Thursday    |
| November  | Nov 1    | Nov 5, 2026    | Thursday    |
| December  | Dec 1    | Dec 3, 2026    | Thursday    |
| Year Day  | --       | Dec 31, 2026   | Thursday    |

**Note**: In the IFC, every month starts on Sunday. The Gregorian dates shown above all fall on Thursday because Jan 1, 2026 is a Thursday. In the IFC, these would all be Sundays (day 1 of each month).

## Understanding the Conversion

### Why all IFC months start on Sunday

The IFC is designed so that:

- **Day 1** of every month = Sunday
- **Day 7** of every month = Saturday (end of week 1)
- **Day 14** of every month = Saturday (end of week 2)
- **Day 21** of every month = Saturday (end of week 3)
- **Day 28** of every month = Saturday (end of week 4)

This means dates are perpetual:

- The 2nd is always Monday
- The 9th is always Monday
- The 16th is always Monday
- The 23rd is always Monday
- The 15th is always Sunday
- The 22nd is always Sunday

### Special Days (Non-Weekdays)

**Leap Day** (in leap years only):

- Occurs after June 28 and before Sol 1
- NOT part of any week
- NOT assigned a weekday name

**Year Day** (every year):

- Occurs after December 28
- NOT part of any week
- NOT assigned a weekday name

These "days out of time" keep the calendar perpetual - without them, the weekday alignment would shift.

## Sample Conversions (2026)

| IFC Date | IFC Weekday | Gregorian Date | Gregorian Weekday |
| -------- | ----------- | -------------- | ----------------- |
| Jan 1    | Sunday      | Jan 1          | Thursday          |
| Jan 7    | Saturday    | Jan 7          | Wednesday         |
| Jan 15   | Sunday      | Jan 15         | Thursday          |
| Feb 1    | Sunday      | Jan 29         | Thursday          |
| Sol 1    | Sunday      | Jun 18         | Thursday          |
| Sol 15   | Sunday      | Jul 2          | Thursday          |
| Dec 28   | Saturday    | Dec 30         | Wednesday         |
| Year Day | (none)      | Dec 31         | Thursday          |

## Conversion Formula

To convert an IFC date to Gregorian day-of-year:

```
day_of_year = (month_number × 28) + day_of_month
```

Where month numbers are:

- January = 0
- February = 1
- March = 2
- April = 3
- May = 4
- June = 5
- Sol = 6
- July = 7
- August = 8
- September = 9
- October = 10
- November = 11
- December = 12

Example: Sol 15 = (6 × 28) + 15 = 183rd day of year

Then look up the 183rd day in the Gregorian calendar:

- Non-leap year: July 2
- Leap year: July 1 (shifted by the mid-year Leap Day)

## The Problem with Gregorian Months

The Gregorian calendar has irregular months:

- 28 days (February, usually)
- 29 days (February in leap years)
- 30 days (April, June, September, November)
- 31 days (January, March, May, July, August, October, December)

This makes it impossible to know what day of the week a date falls on without consulting a calendar or doing complex calculations.

The IFC solves this: every date is the same weekday every year. Your birthday is always the same day of the week!

## Business Benefits

1. **Quarters are equal**: Each quarter = 13 weeks = 91 days
2. **Monthly comparison**: All months have the same number of workdays
3. **Simplified planning**: "The 2nd Monday" is always the 9th
4. **Predictable payroll**: Same number of pay periods every month

## Fun Facts

- In the IFC, there are exactly **52 weeks + 1 day** (or +2 in leap years)
- The 13th falls on Friday in every month (Friday the 13th happens 13 times a year!)
- Your birthday is always the same weekday
- The calendar repeats every year (no need for different years)
