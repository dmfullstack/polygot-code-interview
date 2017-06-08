import sys
from datetime import datetime

def timeit(fn):
    def timed(*args, **kwargs):
        start = datetime.now()
        result = fn(*args, **kwargs)
        end = datetime.now()
        print 'Timeit says this took {}'.format(end - start)
        return result
    return timed


@timeit
def fib_loop(n):
    a, b = 1, 1
    for i in range(n-1):
        a, b = b, a + b
    return a


class Memoize:
    def __init__(self, fn):
        self.memo = {}
        self.fn = fn

    def __call__(self, arg):
        if arg not in self.memo:
            self.memo[arg] = self.fn(arg)
        return self.memo[arg]

@timeit
def timed_fib_recursive(n):
    return fib_recursive(n)

@timeit
def timed_fib_memoized_recursive(n):
    return fib_memoized_recursive(n)

@Memoize
def fib_memoized_recursive(n):
    if n <= 2:
        return 1
    return fib_memoized_recursive(n - 1) + fib_memoized_recursive(n - 2)

def fib_recursive(n):
    if n <= 2:
        return 1
    return fib_recursive(n - 1) + fib_recursive(n - 2)


print('Recursive')
print(timed_fib_recursive(20))
print('Memoized Recursive')
print(timed_fib_memoized_recursive(20))
print('Loop')
print(fib_loop(20))
