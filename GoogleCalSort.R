# __author__ = "Eric Allen Youngson"
# __email__ = "eric@scneco.com"
# __copyright__ = "Copyright Dec. 2016, Succession Ecological Services"
# __license__ = "GNU Affero (GPLv3)"
# 

# install.packages("lubridate") ## Comment out after first call to source()
library("lubridate")

fmatGglCal <- function(f.name){
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
  df$Start.time = as.POSIXct(paste(df$Date, df$Start.time),
                             format="%Y-%m-%d %H:%M")
  df$End.time = as.POSIXct(paste(df$Date, df$End.time),
                             format="%Y-%m-%d %H:%M")
  df$Duration = as.POSIXct(paste(df$Date, df$Duration),
                             format="%Y-%m-%d %H:%M")

  return(df)
}

sortGglCal <- function(df){
  # Takes a dataframe of Google calendar events and returns the percentage of
  # time in each 'Project' (Calendar)
  # 
  # Args:
  #   df (DataFrame): Google calendar data, formatted by the fmatGglCal function
  # 
  # Returns:
  #   SummaryStats (DataFrame): Summary statistics describing time spent major
  #   categories
  projCals = unique(df$Project)
  SummaryStats = vector("list", length(projCals))

  for(i in 1:length(projCals)){
     projCal <- df[df$Project==projCals[i],]
     SummaryStats = append(sum(projCal$End.time - projCal$Start.time),
                           SummaryStats)
  }

  return(SummaryStats)
}

