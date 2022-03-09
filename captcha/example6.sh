#!/bin/bash
IMAGE=$(curl http://192.168.126.134/captcha/example6/ -s|  sed -E -n '/<img/s/.*src="([^"]*)".*/\1/p'  )
$(curl http://192.168.126.134/captcha/example6/$IMAGE -s > test.png)
$(tesseract test.png out)
echo "FOUND!"
exec cat out.txt