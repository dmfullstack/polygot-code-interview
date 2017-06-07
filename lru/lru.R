LRUCache <- R6::R6Class("LRUCache", public = list(
  max_size = NULL,
  cache = list(),
  size = 0,
  initialize = function(max_size) {
    self$max_size <- max_size
  },
  get = function(key) {
    if (key %in% names(self$cache)) { self$cache[[key]] }
    else { NULL }
  },
  set = function(key, value) {
    if (!(key %in% names(self$cache))) {
      if (self$size + 1 > self$max_size) {
        self$cache[[1]] <- NULL
      } else {
        self$size <- self$size + 1
      }
    }
    self$cache[[key]] <- value
    value
  }
))

library(bettertrace)
cache <- LRUCache$new(3)
cache$set('apple', 1)
stopifnot(identical(cache$get('apple'), 1))
stopifnot(is.null(cache$get('pear')))
cache$set('pear', 2)
stopifnot(identical(cache$get('apple'), 1))
stopifnot(identical(cache$get('pear'), 2))
cache$set('pear', 9)
stopifnot(identical(cache$get('apple'), 1))
stopifnot(identical(cache$get('pear'), 9))
cache$set('banana', 3)
stopifnot(identical(cache$get('apple'), 1))
stopifnot(identical(cache$get('pear'), 9))
stopifnot(identical(cache$get('banana'), 3))
cache$set('ford', 4)
stopifnot(is.null(cache$get('apple')))
stopifnot(identical(cache$get('pear'), 9))
stopifnot(identical(cache$get('banana'), 3))
stopifnot(identical(cache$get('ford'), 4))
