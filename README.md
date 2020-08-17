# txt2ducky
Convert a text file to ducky script.

This allows you to easily convert your existing bash scripts / batch files etc to ducky input commands.
Runs on Windows, and wherever bash scripts are found (tested on Xubuntu 20.04).

## Downloads
Windows: [txt2ducky.cmd](https://raw.githubusercontent.com/xsoc/txt2ducky/master/txt2ducky.cmd)
\*Nix: [txt2ducky.sh](https://github.com/xsoc/txt2ducky/blob/master/txt2ducky.sh)

> **Usage:**
>
> `txt2ducky InputFile OutputFile`

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
