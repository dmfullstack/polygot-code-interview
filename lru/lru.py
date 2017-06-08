class LRUCache:
    def __init__(self, max_size):
        self.cache = {}
        self.timings = {}
        self.max_size = max_size
        self.size = 0

    def get(self, key):
        return self.cache.get(key)

    def set(self, key, value):
        if key not in self.cache:
            self.size += 1
        if self.size > self.max_size:
            oldest_key = min(self.timings)
            self.cache.pop(oldest_key)
            self.timings.pop(oldest_key)
        self.cache[key] = value
        self.timings[key] = self.size
        return value

cache = LRUCache(max_size = 3)
cache.set('apple', 1)
print(cache.get('apple') == 1)
print(cache.get('pear') == None)
cache.set('pear', 2)
print(cache.get('apple') == 1)
print(cache.get('pear') == 2)
cache.set('pear', 9)
print(cache.get('apple') == 1)
print(cache.get('pear') == 9)
cache.set('banana', 3)
print(cache.get('apple') == 1)
print(cache.get('pear') == 9)
print(cache.get('banana') == 3)
cache.set('ford', 4)
print(cache.get('apple') == None)
print(cache.get('pear') == 9)
print(cache.get('banana') == 3)
print(cache.get('ford') == 4)
