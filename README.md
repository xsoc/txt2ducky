# txt2ducky
Convert a text file to ducky script.

This allows you to easily convert your existing bash scripts / batch files etc to ducky input commands.
Runs on Windows, and wherever bash scripts are found (tested on Xubuntu 20.04).

## Downloads
Windows: [txt2ducky.cmd](https://raw.githubusercontent.com/xsoc/txt2ducky/master/txt2ducky.cmd)

\*nix: [txt2ducky.sh](https://github.com/xsoc/txt2ducky/blob/master/txt2ducky.sh)

## Usage
> `txt2ducky InputFile [OutputFile]`

If `OutputFile` isn't defined, it will default to `InputFile.txt`

## Sample
If you wanted to deliver your awesome batch file as a payload via ducky script, like the one below...
```batch
@echo off
@echo Super cool awesome batch file
ipconfig
```

Then `txt2ducky` would spit out the following
```ducky
STRING @echo off
ENTER
STRING @echo Super cool awesome batch file
ENTER
STRING ipconfig
ENTER
```

Super basic yet hopefully handy.

## Core Code for Reuse

If you want to use the code in another (batch file) project, all you really need is
```batch
FOR /F "usebackq delims=" %%I IN ("%FILEIN%") DO (
    @echo STRING %%I >> "%FILEOUT%"
    @echo ENTER      >> "%FILEOUT%"
)
```

or in a bash script, go for...
```bash
while read -r line; do
    echo STRING $line >> $fileout
    echo ENTER        >> $fileout
done < $filein
```

## Couldn't You Just Do That With RegEx?
You sure can! Use find and replace in your favourite editor with these settings...

> Find: `.*`
>
> Replace: `STRING $0\nENTER`
