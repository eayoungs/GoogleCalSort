# __author__ = "Eric Allen Youngson"
# __email__ = "eric@scneco.com"
# __copyright__ = "Copyright Dec. 2016, Succession Ecological Services"
# __license__ = "GNU Affero (GPLv3)"
# 

# install.packages("lubridate") ## Comment out after first call to source()
library("lubridate")

sortGglCal <- function(f.name){
  # Reads exported calendar event data from Google Calendar and return a
  # dataframe with useful R types for manipulation with other R functions
  # 
  # Args:
  #   f.name (String): Name of file to be processed
  # 
  # Returns:
  #   A dataframe containing calendar data parameters, with useful R datatypes
  #   for event categories
  df = read.csv(f.name, header = TRUE, stringsAsFactors =FALSE)
  df$Date = as.Date(df$Date, format = '%m/%d/%y')

  return(df)
}
