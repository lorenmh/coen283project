import sys

with open(sys.argv[1], 'rb') as source:
    with open(sys.argv[2], 'wb') as sink:
        sink.write('c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14\n')
        for line in source:
            nums = line.split(',')[:-1]
            floats = map(float, nums)
            srtd = sorted(floats)
            strs = map(lambda f: format(f, 'f'), srtd)
            output = ','.join(strs) + '\n'
            sink.write(output)
