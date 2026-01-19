# International Fixed Calendar Generator - Enhanced Version

## What's New

This enhanced version properly implements the International Fixed Calendar (Cotsworth Plan) with the following improvements:

### 1. **Calendar Corrections and Generalizations for Arbitrary Years**

- The calendar starts each month on a Sunday, as in the Cotsworth Plan
- Each of the 13 months has four Sunday–Saturday weeks, as in the Cotsworth Plan
- December has exactly 28 days (no longer 29/30)
- Each month shows the year after the month name
- The current year is displayed on the cover page

### 2. Proper Year Day Implementation

- Year Day is now a **non-weekday** (day out of time) at the end of the year
- It appears on its own special page after December
- December has exactly 28 days (no longer 29/30)
- Year Day = December 29 in Gregorian calendar (or Dec 30 in leap years)

### 3. **Mid-Year Leap Day in Sol**

- Leap Day is now properly placed after June and before Sol
- It is a **non-weekday** (day out of time)
- Appears as June 29 during leap years
- This follows Moses Cotsworth's original design for calendar symmetry

### 4. **Gregorian Weekday Conversion**

- Each IFC date now shows the corresponding Gregorian weekday abbreviation
- Format: "Mon. Jan. 6" (weekday + month + day)
- Makes it easy to convert between the two calendar systems
- Helps users understand "what day is it really?"

## Key Features of the International Fixed Calendar

- **13 months** of exactly **28 days** each
- Every month starts on **Sunday** and ends on **Saturday**
- **4 perfect weeks** per month (no partial weeks)
- The 13th month is called **Sol** (between June and July)
- **Year Day** (365th day) - not part of any month or week
- **Leap Day** (366th day in leap years) - inserted at the end of June, not part of any week

## Configuration

At the top of the PostScript file, set these variables for your target year:

```postscript
/target_year 2026 def
/leap_yr false def         % Is this a leap year?
/greg_jan1_day 4 def      % What day of week is Jan 1? (0=Sun, 1=Mon, ... 6=Sat)
```

### How to determine greg_jan1_day:

For any year, find what day of the week January 1 falls on:

- Sunday = 0
- Monday = 1
- Tuesday = 2
- Wednesday = 3
- Thursday = 4
- Friday = 5
- Saturday = 6

Examples:

- 2026: January 1 = Thursday → `greg_jan1_day = 4`
- 2024: January 1 = Monday → `greg_jan1_day = 1`
- 2025: January 1 = Wednesday → `greg_jan1_day = 3`

### Leap Year Detection

A year is a leap year if:

- Divisible by 4 AND
- (NOT divisible by 100 OR divisible by 400)

Examples:

- 2024: leap year (divisible by 4)
- 2025: not a leap year
- 2026: not a leap year
- 2000: leap year (divisible by 400)
- 1900: not a leap year (divisible by 100 but not 400)

## Usage

Generate the calendar PDF with:

```bash
gs -o calendar.pdf -dEmbedAllFonts=true -sDEVICE=pdfwrite calendar.ps
```

## Why the International Fixed Calendar?

As Moses Cotsworth argued in the early 20th century:

1. **Perpetual Dates**: The 15th is always a Sunday, the 20th always a Friday, etc.
2. **Equal Quarters**: Business quarters are truly equal (91 days each)
3. **Simplified Accounting**: Every month has exactly 4 weeks
4. **Rational**: No more 28, 30, 31 day irregularity
5. **"A month is nothing but a bad habit"** — see the article entitled Shall We Scrap Our Calendar? from pages 109–112 of the September 28, 1927 issue of *The Outlook* (PDF included in this repository)

## Historical Note

The IFC was nearly adopted by the League of Nations in the 1930s and was used by Kodak internally for 60+ years (1928-1989). George Eastman (Kodak founder) was a major proponent, which is why Sol includes his birthday (Sol 26).

## Credits

- Original PostScript calendar: Zac Levinson (2015)
- IFC corrections and enhancements by Kim Slawson: 2026 revision
- Calendar system: Moses Cotsworth (1902)
