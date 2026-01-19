# Automatic Year Configuration Script

**File:** `config_year.sh`

This shell script automatically configures the calendar for any year by:

- Detecting if it's a leap year
- Calculating what day of the week January 1 falls on
- Updating the PostScript configuration variables

**Usage:**

```bash
# Configure for current year
./config_year.sh

# Configure for specific year
./config_year.sh 2027

# Then generate PDF
gs -o calendar_2027.pdf -dEmbedAllFonts=true -sDEVICE=pdfwrite calendar.ps
```

**How it works:**

1. Takes year as argument (or uses current system year)
2. Calculates leap year status using proper algorithm
3. Uses system `date` command to determine January 1 weekday
4. Updates three configuration variables in calendar.ps:
   - `/target_year`
   - `/leap_yr`
   - `/greg_jan1_day`
5. Creates backup file before making changes

**Compatibility:**

- Works on macOS and Linux
- Uses BSD date on macOS, GNU date on Linux
- Creates `.bak` backup file automatically

## Technical Details

### Leap Year Algorithm

```bash
if (year % 4 == 0):
    if (year % 100 == 0):
        if (year % 400 == 0):
            return true  # Like 2000, 2400
        else:
            return false  # Like 1900, 2100
    else:
        return true  # Like 2024, 2028
else:
    return false  # Like 2025, 2026
```

### Day of Week Calculation

Uses system `date` command for accuracy:

```bash
# macOS (BSD date)
date -j -f "%Y-%m-%d" "2026-01-01" "+%w"

# Linux (GNU date)
date -d "2026-01-01" "+%w"
```

Returns: 0=Sunday, 1=Monday, ..., 6=Saturday

## Quick Start

For the current year:

```bash
./config_year.sh
gs -o calendar_2026.pdf -dEmbedAllFonts=true -sDEVICE=pdfwrite calendar.ps
```

For a future year:

```bash
./config_year.sh 2030
gs -o calendar_2030.pdf -dEmbedAllFonts=true -sDEVICE=pdfwrite calendar.ps
```

## Notes

The configuration script creates a `.bak` backup file before modifying `calendar.ps`. If you need to revert changes, simply restore from this backup:

```bash
cp calendar.ps.bak calendar.ps
```
