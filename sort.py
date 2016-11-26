import sys

with open(sys.argv[1], 'rb') as source:
    with open(sys.argv[2], 'wb') as sink:
        for line in source:
            nums = line.split(',')[:-1]
            floats = map(float, nums)
            srtd = sorted(floats)
            strs = map(lambda f: format(f, 'f'), srtd)
            output = ','.join(strs) + '\n'
            sink.write(output)
