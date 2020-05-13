# Notes

## What does it stand for

SH - Bourne shell, by Stephen Bourne at Bell Labs

BASH - Bourne again shell (born again shell)

PERL - Practical Extraction and Report Language

POSIX usually follows existing implementation, it rarely specifies new behavior. There are multiple shells around; for the most part, POSIX follows the Korn shell but omits most features that are not present in the Bourne shell (**as the Bourne shell is largely abandoned**, the next version of POSIX is likely to include new ksh features though).

## Expansion in POSIX

- First step, beginning to end
  - Tilde expansion --> ~
  - Parameter expansion --> ?
  - command substitution --> ?
  - Arithmetic expansion --> ?
- Second step - Field splitting (unless IFS is null) --> ?
- Thrid step - Pathname expansion (unless set -f is in effect) --> ?
- Fourth step - Quote removal

Expansion in BASH (https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_04.html)

The "$" character introduces **parameter expansion**, **command substitution**, or **arithmetic expansion**.

1. Brace expansion
   1. echo sp{el,il,al}l
   2. Gets expanded in place
   3. echo \"aa{1,2,3,4,5}ee\"
2. Tilde expansion
   1. export PATH="$PATH:~/testdir"
3. Shell parameter and variable expansion
   1. $PARAMETER
   2. ${PARAMETER}
   3. echo ${FRANKY:=Franky}
   4. echo ${!N*}
   5. echo ${variable:-word}
   6. echo ${variable:=word}

```bash
$ export xyzzy=plugh ; export plugh=cave

$ echo ${xyzzy}  # normal, xyzzy to plugh
plugh

$ echo ${!xyzzy} # indirection, xyzzy to plugh to cave
cave
```

4. Command substitution
   1. $(command) aka \`command\`
5. Arithmetic expansion
   1. $(( EXPRESSION ))
   2. $[ EXPRESSION ]
   3. echo $((2 * $((3+4)) + $((12-3))))
   4. echo $[2 * $[3+4] + $[12-3]]
6. Process substitution
   1. TODO though we don't really cover this
7. Word splitting
   1. a='b c'
   2. mkdir $a  # creates two directories
   3. mkdir "$a"  # creates only one directory
   4. a="ls -l"
   5. $a  # same as running ls -l
8. File name expansion
   1. The symbols:
      1. \* -- \*.txt -- anything, can also be empty 
      2. \? -- a?c -- any symbol, but only one
      3. \[ -- [abc] aka [a-c] -- a or b or c
   2. Abcd...
   3. [^\(] aka [!\(]
   4. [abc[]
   5. [-abc] aka [abc-]
   6. POSIX -- [:class:]
      1. [:alnum:]
      2. [:alpha:]
      3. [:ascii:]
      4. [:blank:]
      5. [:digit:]
      6. [:lower:]
      7. [:upper:]
      8. [:space:]
      9. [:cntrl:]
      10. [:graph:]
      11. [:print:]
      12. [:punct:]
      13. [:xdigit:]
      14. [:word:]
      15. ls [[:alpha:]]*[[:digit:]]*

```bash
#!/usr/bin/env bash
# -*- coding: utf-8 -*-utf-8 -*-

echo aee
echo $BASH_ENV
echo aee

for item in {a,b,c}; do
    echo "$item"
done

month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
echo ${month[3]}

letter_combos=({a..z}{a..z})
echo ${letter_combos[0]}
echo ${letter_combos[1]}
echo ${letter_combos[200]}

dec2bin=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
echo ${dec2bin[25]}

a="Too longgg"
echo ${a%gg}
echo ${a%xg}

# tldr convert
convert image.jpg image.png

i=image.jpg
convert $i ${i%jpg}png
for i in *.jpg; do convert $i ${i%jpg}png; done

a="Hello World!"
echo Goodbye${a#Hello}, gonna go sleep

echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls > PNGs.txt
vs
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt
```

## Some basic linux system commands

```bash
uname -a
uname -v

date
date --utc
uptime
last reboot

hostname # aka uname -n
hostname -i # show all network addresses

```

Kernel version information **uname -r** or **cat /proc/version**:

- **5.4.27-1-MANJARO**
  - 5 -- kernel version
  - 4 -- major revision
  - 27 -- minor revision
  - 1 -- patch number
  - MANJARO -- distribution specific information

## He wanted some lederhosen

```bash
brain="brian"
echo "${brain}"
echo "${brain%n}"
echo "${brain#b}"
echo "${brain^}"
echo "${brain^^}"
echo "${brain,}"
echo "${brain,,}"

gifts=(sweater gameboy wagon pillows chestnuts hairbrush)
printf '%s\n' "${gifts[@]:0:2}"
printf '%s\n' "${gifts[@]:2:2}"
printf '%s\n' "${gifts[@]: -2}"
```

## All the things you said

```bash
#korisno:
sort imena.txt -o imena.txt
#jer ovo ne radi!
sort imena.txt > imena.txt
```

- TODO
  - [x] parameter vs variable
    - [ ] `-parameter`
    - [ ] `$var` or `${var}`
  - [ ] I do not really understand neither "something" or 'something'
  - [ ] ponavljanje se obavlja prije ulančavanja, a tek nakon toga dolazi na red alternacija
  - [ ] well i dont really have the command locate (and updatedb)..
  - [ ] cat, ls and the rest are just additional programs or do they come bundled with bash? And what about locate?
  - [ ] CTRL-D to end stdin?
  - [ ] CTRL-S to freeze/stop inputting, CTRL+Q to continue. For ex. `cat > input.txt`
  - [ ] google "linux variable ps1"
