# A happy number is a number defined by the following process: Starting with any positive integer,
# replace the number by the sum of the squares of its digits, and repeat the process until the number
# either equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
# Those numbers for which this process ends in 1 are happy numbers, while those that do not end in 1
# are unhappy numbers (or sad numbers).  In any language you like, write me a program to determine
# whether a number is happy or not.

def square(x):
    return x * x

def digits(num):
    """Take a number and turn it into a vector of digits."""
    return [int(i) for i in str(num)]


def is_happy_using_fixed_recursive(num):
    if num == 1:
        return True
    elif num == 4:
        return False
    else:
        return is_happy_using_fixed_recursive(sum([square(d) for d in digits(num)]))


def is_happy_using_loop(num):
    visited = []
    while num != 1:
        if num in visited:
            return False
        visited.append(num)
        num = sum([square(d) for d in digits(num)])
    return True


def is_happy_using_unfixed_recursive(num, visited=[]):
    if num in visited:
        return False
    return num == 1 or is_happy_using_unfixed_recursive(sum([square(d) for d in digits(num)]), visited + [num])

def is_happy(num):
    return [is_happy_using_fixed_recursive(num), is_happy_using_loop(num), is_happy_using_unfixed_recursive(num)]

print(is_happy(10))
print(is_happy(50))
print(is_happy(320))
print(is_happy(1000))
print(is_happy(4680))
