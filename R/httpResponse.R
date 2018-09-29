#' @name httpResponse.header
#' @export
#' @title Create a HTTP Response Header
#' @param type file type or standard extension
#' @return A character string containing a valid HTTP Response header.
#' @description This function will generate a header string containing only a
#' minimal set of possible response header elements including:
#' \itemize{
#' \item{\code{Content-Type}}
#' }
#' @examples
#' httpResponse.header('text')
#' httpResponse.header('json')
#' httpResponse.header('png')

httpResponse.header <- function(type="text") {
  
  # NOTE:  Only one element for now -- "Content-Type:"
  headerElements <- c(httpResponse.contentType(type)) 
  
  # Paste elements together on separate lines and add two extra carriage returns
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
  
  # mime::guess_type expects an initial "."
  if ( !stringr::str_detect(".", type) ) {
    type <- paste0(".",type)
  }
  
  return(paste0("Content-Type: ", mime::guess_type(type)))
  
}
