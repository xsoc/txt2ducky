```
                       ████████╗██╗  ██╗████████╗██████╗ ██████╗ ██╗   ██╗ ██████╗██╗  ██╗██╗   ██╗
                       ╚══██╔══╝╚██╗██╔╝╚══██╔══╝╚════██╗██╔══██╗██║   ██║██╔════╝██║ ██╔╝╚██╗ ██╔╝
                          ██║    ╚███╔╝    ██║    █████╔╝██║  ██║██║   ██║██║     █████╔╝  ╚████╔╝ 
                          ██║    ██╔██╗    ██║   ██╔═══╝ ██║  ██║██║   ██║██║     ██╔═██╗   ╚██╔╝  
                          ██║   ██╔╝ ██╗   ██║   ███████╗██████╔╝╚██████╔╝╚██████╗██║  ██╗   ██║   
                          ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝   
                                          Quickly convert text for ducky scripts
```
This allows you to easily prepare text files (e.g. your existing bash scripts / batch files etc) to [ducky](https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Duckyscript) input commands for easier deployment.
Runs on Windows, and wherever bash scripts are found (tested on Xubuntu 20.04).

Tested successfully on a real [Rubber Ducky](https://shop.hak5.org/products/usb-rubber-ducky-deluxe) and with the [Rucky](https://github.com/mayankmetha/Rucky) app on a rooted Android phone.

## Downloads
Windows: [txt2ducky.cmd](https://raw.githubusercontent.com/xsoc/txt2ducky/master/txt2ducky.cmd)

Linux/etc: [txt2ducky.sh](https://github.com/xsoc/txt2ducky/blob/master/txt2ducky.sh)

Bash users, don't forget to `chmod +x ./txt2ducky.sh`, and you can even `mv ./txt2ducky.sh ./txt2ducky` if you prefer to drop the extension.

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
You sure can! Use find and replace in your favourite regex capable text editor with these settings...

> Find: `.*`
>
> Replace: `STRING $0\nENTER`

Tested sucessfully in Notepad++ :)
