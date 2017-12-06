#' @name httpResponse.header
#' @export
#' @title Create a HTTP Response Header
#' @param type file type or standard extension
#' @return A character string containing a valid HTTP Response header.
#' @description This function will generate a header string containing only a minimal
#' set of possible response header elements including:
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
#' @param type file type or standard extension
#' @return A character string with the appropriate MIME type.
#' @description The \code{type} parameter is typically the file extension.
#' @examples
#' httpResponse.contentType('text')
#' httpResponse.contentType('json')
#' httpResponse.contentType('png')

httpResponse.contentType <- function(type="text") {
  
  return(paste0("Content-Type: ",mimeType(type)))
  
}


#' @name mimeType
#' @export
#' @title Create a MIME Type String
#' @param type file type or standard extension
#' @return A character string with the appropriate MIME type.
#' @description The \code{type} parameter is typically the file extension.
#' @references \href{https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Complete_list_of_MIME_types}{MDN MIME types for the web}
#' @references \href{http://www.iana.org/assignments/media-types/media-types.xhtml}{IANA all media types}
#' @references \href{https://en.wikipedia.org/wiki/Media_type}{Wikipedia media types}
#' @examples
#' mimeType('text')
#' mimeType('json')
#' mimeType('png')

mimeType <- function(type="text") {
  
  # From https://en.wikipedia.org/wiki/Media_type
  
  if ( type == "css" ) returnString <- "text/css"
  else if ( type == "csv" ) returnString <- "text/csv"
  else if ( type == "doc" ) returnString <- "application/msword (.doc)"
  else if ( type == "gif" ) returnString <- "image/gif"
  else if ( type == "htm" ) returnString <- "text/html"
  else if ( type == "html" ) returnString <- "text/html"
  else if ( type == "js" ) returnString <- "application/javascript"
  else if ( type == "json" ) returnString <- "application/json"
  else if ( type == "jpeg" ) returnString <- "image/jpeg"
  else if ( type == "jpg" ) returnString <- "image/jpeg"
  else if ( type == "mpeg" ) returnString <- "audio/mpeg"
  else if ( type == "pdf" ) returnString <- "application/pdf"
  else if ( type == "png" ) returnString <- "image/png"
  else if ( type == "ppt" ) returnString <- "application/vnd.ms-powerpoint (.ppt)"
  else if ( type == "pptx" ) returnString <- "application/vnd.openxmlformats-officedocument.presentationml.presentation (.pptx)"
  else if ( type == "sql" ) returnString <- "application/sql"
  else if ( type == "text" ) returnString <- "text/plain"
  else if ( type == "txt" ) returnString <- "text/plain"
  else if ( type == "vorbis" ) returnString <- "audio/vorbis"
  else if ( type == "xls" ) returnString <- "application/vnd.ms-excel (.xls)"
  else if ( type == "xlsx" ) returnString <- "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet (.xlsx)"
  else if ( type == "xml" ) returnString <- "application/xml"
  else if ( type == "zip" ) returnString <- "application/zip"
  # if ( type == "WHAT TYPE TO RECOGNIZE?" ) returnString <- "application/x-www-form-urlencoded"
  #else if ( type == "WHAT TYPE TO RECOGNIZE?" ) returnString <- "multipart/form-data"
  else stop(paste0("Unrecognized type: '",type,"'"))
  
  return(returnString)
  
}
