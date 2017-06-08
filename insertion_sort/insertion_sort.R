insertion_sort <- function(items) {
  for (i in seq_along(items)) {
    j <- i
    while (j > 1 && items[[j]] < items[[j-1]]) {
      tmp <- items[[j-1]]
      items[[j-1]] <- items[[j]]
      items[[j]] <- tmp
      j <- j - 1
    }
  }
  items
}
print(insertion_sort(c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8)))
