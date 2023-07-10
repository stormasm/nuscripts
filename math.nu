
def arc [] {

print "Get the arccosine of 1 is 0"
1 | math arccos | print
print ""

print "Get the arccosine of -1 in degrees is 180"
-1 | math arccos -d | print
print ""

print "Get the arccosh of 1 is 0"
1 | math arccosh | print
print ""

print "Get the arcsine of 1 is 1.57"
1 | math arcsin | print
print ""

print "Get the arcsine of 1 in degrees is 90"
1 | math arcsin -d | print
print ""

print "Get the arcsinh of 0 is 0"
0 | math arcsinh | print
print ""

print "Get the arctangent of 1 is 0.78"
1 | math arctan | print
print ""

print "Get the arctangent of -1 in degrees is -45"
-1 | math arctan -d | print
print ""

print "Get the arctanh of 1 is inf"
1 | math arctanh | print
print ""

}
