#!/bin/bash
rm ss.png 
/usr/sbin/screencapture -iU ss.png
mv Screenshot*.png ss.png
curl -H "authorization: AUTHORIZATION_KEY" https://UR_ZIPLINE_URL/api/upload -F file=@/Users/USERNAME/zipline/ss.png -H "Content-Type: multipart/form-data" -H "Format: date" -H "Embed: true" | jq -r '.files[0]' | tr -d '\n' | pbcopy;
