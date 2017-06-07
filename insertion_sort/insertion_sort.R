insert_at <- function(items, item, pos = length(items) + 1) {
  if (pos < 1 || pos > length(items) + 1) { stop("Index error.") }
  c(head(items, pos-1), item, tail(items, length(items) - pos + 1))
}

insertion_sort <- function(items) {
  sorted_items <- items[[1]]
  for (i in seq_along(items)) {
    found <- FALSE
    for (j in seq_along(sorted_items)) {
      if (sorted_items[[j]] > items[[i]]) {
        sorted_items <- insert_at(sorted_items, items[[i]], j)
        found <- TRUE
        break
      }
    }
    if (!found) { sorted_items <- insert_at(sorted_items, items[[i]]) }
  }
  sorted_items
}
print(insertion_sort(c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8)))
