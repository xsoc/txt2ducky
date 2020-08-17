# txt2ducky
Convert a text file to ducky script.

This allows you to easily convert your existing bash scripts / batch files etc to ducky input commands.

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
