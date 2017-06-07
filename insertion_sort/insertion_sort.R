insert_at <- function(items, item, pos) {
  if (pos < 1 || pos > length(items) + 1) { stop("Index error.") }
  c(head(items, pos-1), item, tail(items, length(items) - pos + 1))
}

insertion_sort <- function(items) {
  sorted_items <- items[[1]]
  for (i in seq_along(items)) {
    j <- 1
    while (sorted_items[[j]] < items[[i]]) {
      j <- j + 1
      if (j > length(sorted_items)) { break }
    }
    sorted_items <- insert_at(sorted_items, items[[i]], j)
  }
  sorted_items
}
print(insertion_sort(c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8)))
