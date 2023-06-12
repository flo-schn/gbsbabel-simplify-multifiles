# bash scipt to execute gpsbabel simplifyy on all .gpx files in directory

place `script.sh` in same directory as gpx files to be simplified

then run 
```bash 
bash script.sh
```

currently set to simplify track to a 10th of previous size. ajust according in `script.sh` to what is needed.

## to-dos:
- request the user in termnial to approve [Y/n] after sizes of gpx files is shown and before simplification is done
- include a security hook for very small files.
- ask user to put fraction in instead of hardcoded in script