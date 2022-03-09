import urllib.request
import re

html = urllib.request.urlopen("http://192.168.126.134/captcha/example9/").read()
expression = re.findall(b'"get">\n  (.*?) = <input',html)
print(eval(expression[0]))