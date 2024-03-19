import datetime

def get_current_rundate():
    # Get the current date
    current_date = datetime.datetime.now()
    
    # Extract year and day of year
    year = current_date.year
    day_of_year = current_date.timetuple().tm_yday
    
    # Format rundate as 7-digit number (4 digits for year, 3 digits for day of year)
    rundate = int(str(year) + '{:03d}'.format(day_of_year))
    
    return rundate

# Example usage
print("Current rundate:", get_current_rundate())
