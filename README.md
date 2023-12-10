# Zipline-Mac-Upload
A script that will upload your screenshot from MacOS's native screenshot tool to Zipline (or any other upload service) then copy the screenshot url to your clipboard

## Break Down of Script

```bash
#!/bin/bash
rm ss.png 
/usr/sbin/screencapture -iU ss.png
mv Screenshot*.png ss.png
curl -H "authorization: AUTHORIZATION_KEY" https://UR_ZIPLINE_URL/api/upload -F file=@/Users/USERNAME/zipline/ss.png -H "Content-Type: multipart/form-data" -H "Format: date" -H "Embed: true" | jq -r '.files[0]' | tr -d '\n' | pbcopy;
```
#### 1. First we removed any existing "ss.png" file from our directory
#### 2. Then we open up the screenshot tool (make sure in options to set your save directory to the one with the script).
#### 3. We rename the screenshot file to ss.png
#### 4. Finally, we send an upload request to our Zipline server plugging in the file name (change it if zipline is not the directory you are using) and parsing the response and copying the url to your clipboard.

## Extras

### Adjust Screencapture parameters

You can change the screencapture parameters if you want to change how your screenshot tool pops up. You can see a list of different parameters by typing:
```bash
screencapture -h
```

### Trigger by a keyboard combination command

You can use [ICanHazShortcut](https://github.com/deseven/icanhazshortcut) App to create a custom keyboard combination to trigger the script.
