# Y2038
humanity will face a significant software problem on 03:14:08 UTC on 19 January 2038.
this piece of code can be used to test whether Y2038 bug exists on GNU/Linux system, and potential mitigations.

to my knowledge; up-to-date *BSD, macOS and Windows systems are not affected. 
however, GNU/Linux userland binaries are still at risk due to glibc defaulting to 32-bits `time_t`.

## what happens?
from wikipedia:
```
The problem exists in systems which measure Unix time—the number of seconds elapsed 
since the Unix epoch (00:00:00 UTC on 1 January 1970)—and store it in a signed 32-bit integer. 
The data type is only capable of representing integers between −(231) and 231 − 1, 
meaning the latest time that can be properly encoded is 231 − 1 seconds after epoch (03:14:07 UTC on 19 January 2038). 
Attempting to increment to the following second (03:14:08) will cause the integer to overflow,
setting its value to −(231) which systems will interpret as 231 seconds before epoch (20:45:52 UTC on 13 December 1901). 
The problem is similar in nature to the year 2000 problem, the difference being the Year 2000 problem had to do with base 10 numbers, 
while the Year 2038 problem has to do with base 2 numbers. 
```

## requirements
a modern C compiler and a GNU/Linux system with glibc 2.34+.

## building
run `make y2038-32 && ./y2038-32`. this command will display whether Y2038 overflows for you and rewinds back to 1900s.

## mitigation
run `make y2038-32-fixed && ./y2038-32-fixed`. this will force the C library to use a 64-bit `time_t` through `_TIME_BITS=64`.

## license
this program is marked with CC0 1.0 and is under public domain.
