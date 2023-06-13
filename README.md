# bash scipt to execute gpsbabel simplifyy on all .gpx files in directory

place `script.sh` in same directory as gpx files to be simplified

then run 
```bash 
bash script.sh
```

uses gpsbabel to [simplify](https://www.gpsbabel.org/htmldoc-1.8.0/filter_simplify.html) and thus reduce the number of trackpoints of a track in gpx files.

## to-dos:
- include a security hook for very small files.
- add more gpsbabel manipulations: eg remove duplicates, merge segements, 
- allow enter key for confirmation
- make sure that fraction userinput is an integer
- allow for spaces in filenames
