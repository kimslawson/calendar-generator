#!/bin/bash
# config_year.sh - Auto-configure IFC calendar for current year
# Usage: ./config_year.sh [year]
# If no year is provided, uses current system year

# Determine target year
if [ -n "$1" ]; then
    YEAR=$1
else
    YEAR=$(date +%Y)
fi

echo "Configuring calendar for year $YEAR..."

# Determine if leap year
# Leap year if: divisible by 4 AND (NOT divisible by 100 OR divisible by 400)
if [ $((YEAR % 4)) -eq 0 ]; then
    if [ $((YEAR % 100)) -eq 0 ]; then
        if [ $((YEAR % 400)) -eq 0 ]; then
            LEAP="true"
        else
            LEAP="false"
        fi
    else
        LEAP="true"
    fi
else
    LEAP="false"
fi

# Calculate day of week for January 1 using Zeller's congruence
# (adjusted for Gregorian calendar, with Sunday=0)
# Note: This uses a simplified approach via 'date' command for reliability
JAN1_DOW=$(date -j -f "%Y-%m-%d" "${YEAR}-01-01" "+%w" 2>/dev/null || date -d "${YEAR}-01-01" "+%w" 2>/dev/null)

if [ -z "$JAN1_DOW" ]; then
    echo "Error: Could not determine day of week for January 1, $YEAR"
    echo "Please ensure 'date' command is available"
    exit 1
fi

echo "Year: $YEAR"
echo "Leap year: $LEAP"
echo "January 1 day of week: $JAN1_DOW (0=Sun, 1=Mon, ..., 6=Sat)"

# Update the PostScript file
PS_FILE="calendar.ps"

if [ ! -f "$PS_FILE" ]; then
    echo "Error: $PS_FILE not found in current directory"
    exit 1
fi

# Create backup
cp "$PS_FILE" "${PS_FILE}.bak"
echo "Backup created: ${PS_FILE}.bak"

# Update the configuration variables using sed
# macOS sed requires -i '' while Linux sed requires -i
if [[ "$OSTYPE" == "darwin"* ]]; then
    SED_INPLACE="sed -i '' "
else
    SED_INPLACE="sed -i "
fi

# Update target_year
$SED_INPLACE "s|^/target_year [0-9]\+ def|/target_year $YEAR def|g" "$PS_FILE"

# Update leap_yr
$SED_INPLACE "s|^/leap_yr \(true\|false\) def|/leap_yr $LEAP def|g" "$PS_FILE"

# Update greg_jan1_day
$SED_INPLACE "s|^/greg_jan1_day [0-9]\+ def|/greg_jan1_day $JAN1_DOW def|g" "$PS_FILE"

echo "Updated $PS_FILE with:"
echo "  /target_year $YEAR def"
echo "  /leap_yr $LEAP def"
echo "  /greg_jan1_day $JAN1_DOW def"

# Show the day name for clarity
DAY_NAMES=("Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday")
echo ""
echo "Summary: $YEAR starts on ${DAY_NAMES[$JAN1_DOW]}"
if [ "$LEAP" = "true" ]; then
    echo "         $YEAR is a leap year (366 days)"
else
    echo "         $YEAR is not a leap year (365 days)"
fi

echo ""
echo "Configuration complete! You can now generate the PDF with:"
echo "  gs -o calendar_${YEAR}.pdf -dEmbedAllFonts=true -sDEVICE=pdfwrite $PS_FILE"
