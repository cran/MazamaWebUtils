#' @name httpResponse.header
#' @export
#' @title Create a HTTP Response Header
#' @param type file type used to generate the Content-Type string
#' @return A text string containing a valid HTTP Response header.
#' @description This function will generate a header string containing only a minimal
#' list of possible response header elements including:
#' \itemize{
#' \item{\code{Content-Type}}
#' }
#' @examples
#' httpResponse.header('text')
#' httpResponse.header('json')
#' httpResponse.header('png')

httpResponse.header <- function(type="text") {
  
  # Mimicking some elements of https://github.com/Bart6114/jug/blob/master/R/response.R
 
  headerElements <- c(httpResponse.contentType(type)) 
  
  # Paste header elements together on separate lines and add two extra carriage returns
  return(paste0(paste0(headerElements,collapse="\n"),"\n\n"))
  
}

#' @name httpResponse.contentType
#' @export
#' @title Create a Content Type String
#' @param type named type of file
#' @return A character string with the appropriate MIME type.
#' @description The \code{type} parameter is typically the file extension.
#' @examples
#' httpResponse.contentType('text')
#' httpResponse.contentType('json')
#' httpResponse.contentType('png')

httpResponse.contentType <- function(type="text") {
  
  # From https://en.wikipedia.org/wiki/Media_type
  
  if ( type == "js" ) mimeType <- "application/javascript"
  else if ( type == "json" ) mimeType <- "application/json"
  # if ( type == "WHAT TYPE TO RECOGNIZE?" ) mimeType <- "application/x-www-form-urlencoded"
  else if ( type == "xml" ) mimeType <- "application/xml"
  else if ( type == "zip" ) mimeType <- "application/zip"
  else if ( type == "pdf" ) mimeType <- "application/pdf"
  else if ( type == "doc" ) mimeType <- "application/msword (.doc)"
  else if ( type == "xls" ) mimeType <- "application/vnd.ms-excel (.xls)"
  else if ( type == "xlsx" ) mimeType <- "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet (.xlsx)"
  else if ( type == "sql" ) mimeType <- "application/sql"
  else if ( type == "ppt" ) mimeType <- "application/vnd.ms-powerpoint (.ppt)"
  else if ( type == "pptx" ) mimeType <- "application/vnd.openxmlformats-officedocument.presentationml.presentation (.pptx)"
  else if ( type == "mpeg" ) mimeType <- "audio/mpeg"
  else if ( type == "vorbis" ) mimeType <- "audio/vorbis"
  #else if ( type == "WHAT TYPE TO RECOGNIZE?" ) mimeType <- "multipart/form-data"
  else if ( type == "css" ) mimeType <- "text/css"
  else if ( type == "html" ) mimeType <- "text/html"
  else if ( type == "htm" ) mimeType <- "text/html"
  else if ( type == "csv" ) mimeType <- "text/csv"
  else if ( type == "txt" ) mimeType <- "text/plain"
  else if ( type == "text" ) mimeType <- "text/plain"
  else if ( type == "png" ) mimeType <- "image/png"
  else if ( type == "jpeg" ) mimeType <- "image/jpeg"
  else if ( type == "jpg" ) mimeType <- "image/jpeg"
  else if ( type == "gif" ) mimeType <- "image/gif"
  else stop(paste0("Unrecognized type: '",type,"'"))
  
  return(paste0("Content-Type: ",mimeType))
  
}
