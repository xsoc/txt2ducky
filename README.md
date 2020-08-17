# txt2ducky
Convert a text file to ducky script.

This allows you to easily convert your existing bash scripts / batch files etc to ducky input commands.

> **Usage:**
>
> `Txt2Ducky InputFile OutputFile`

If you want to use the code in another (batch file) project, all you really need is
```batch
FOR /F "usebackq delims=" %%I IN ("%FILEIN%") DO (
    @echo STRING %%I >> "%FILEOUT%"
    @echo ENTER      >> "%FILEOUT%"
)
```
