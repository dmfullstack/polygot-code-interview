def insertion_sort(items):
    for i in range(1, len(items)):
        j = i
        while j > 0 and items[j] < items[j-1]:
            items[j], items[j-1] = items[j-1], items[j]
            j -= 1
    return items

print(insertion_sort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8]))
