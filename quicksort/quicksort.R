quicksort <- function(items) {
  if (identical(items, numeric(0))) { numeric(0) }
  else {
    init_item <- head(items, 1)
    tail_items <- tail(items, -1)
    c(quicksort(Filter(function(x) x < init_item, tail_items)), init_item, quicksort(Filter(function(x) x >= init_item, tail_items)))
  }
}
print(quicksort(c(3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8)))
