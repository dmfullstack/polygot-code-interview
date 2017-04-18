import string
import sys

letters = list(string.ascii_lowercase)
sentence = sys.argv[1]
shift = int(sys.argv[2])

print(''.join(map(lambda n: letters[n],
                  map(lambda n: n + shift,
                      map(lambda l: letters.index(l), list(sentence))))))
