#!/bin/bash
IMAGE=$(curl http://192.168.126.134/captcha/example8/ -s|  sed -E -n '/<img/s/.*src="([^"]*)".*/\1/p'  )
$(curl http://192.168.126.134/captcha/example8/$IMAGE -s > test.png)
$(convert test.png  -white-threshold 25%   test.png)
$(tesseract test.png out)
echo "FOUND!"
RESULT=$(cat out.txt)
echo $RESULT