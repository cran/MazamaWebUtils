#' @name cgiRequest
#' @export
#' @title Create a CGI Request Object
#' @param testParams URL request parameters for testing GET requests
#' @return A list containing CGI request elements
#' @description A request object is created from the appropriate environment
#' variables and is returned as a list. List elements include:
#' \itemize{
#' \item{params -- list of request parameters}
#' \item{headers -- list of HTTP headers}
#' \item{method -- "GET"}
#' \item{raw -- NULL}
#' \item{content_type -- NULL}
#' \item{protocol -- "http"}
#' \item{body -- NULL}
#' }
#' @details Even in the modern era (>= 2017) it is still sometimes useful to
#' build simple web services using CGI scripts. Benefits include: ease of coding;
#' use of standard port 80; service uptime: even if the CGI script dies while
#' handling an earlier request, the script will be restarted for the next request.
#' 
#' Using this function, the body of an R CGI script can begin with:
#' \preformatted{
#' req <- cgiRequest()
#' headers <- req$params
#' params <- req$params
#' ...
#' }
#' @note The returned object mimics the request object created in the \pkg{jug} package.
#' @examples
#' # Example borrowed from webutils::parse_query
#' q <- "foo=1%2B1%3D2&bar=yin%26yang"
#' req <- cgiRequest(q)
#' str(req$params)
#' @references \url{https://github.com/Bart6114/jug/blob/master/R/request.R}

cgiRequest <- function(testParams=NULL) {
  
  # Mimicking https://github.com/Bart6114/jug/blob/master/R/request.R
  
  # Initialize request object
  req <- list(params=list(),
              headers=list(),
              method=NULL,
              raw=NULL,
              content_type=NULL,
              protocol="http",
              body=NULL)
  
  if ( !is.null(testParams) ) {
    
    # Process test parameters
    req$method <- "GET"
    req$params <- webutils::parse_query(testParams)
    
  } else {

    # Create a named vector of environment variables for easier masking
    # NOTE:  Sys.getenv() returns a weird "Dlist" thingy
    env <- as.character(Sys.getenv())
    names(env) <- names(Sys.getenv())
    
    # HTTP headers
    headers <- env[stringr::str_detect(names(env), "^HTTP_")]
    headerNames <- stringr::str_replace(names(headers), "^HTTP_", "")
    req$headers <- stats::setNames(as.list(headers), headerNames)

    # Remove the names when assigning (ugh!)
    req$method <- unname(env["REQUEST_METHOD"])
    req$params <- webutils::parse_query(unname(env["QUERY_STRING"]))
    req$uri <- unname(env["REQUEST_URI"])
    
  }
    
  return(req)

}
