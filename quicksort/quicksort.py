def quicksort(xs):
    if xs == []:
        return []
    x = xs[0]
    xs = xs[1:]
    return quicksort(filter(lambda n: n <= x, xs)) + [x] + quicksort(filter(lambda n: n > x, xs))

print(quicksort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8]))
