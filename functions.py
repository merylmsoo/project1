import re
from flask import *
import pymysql
def checkpassword(password):
    if len(password)<6:
        return "your password is too short"
    elif re.search(r"[A-Z]", password):
        return "atleast 1 upper case"
    elif re.search(r"[a-z]", password):
        return "atleast 1 lower case"
    elif re.search(r"[A-Z]", password):
       return "atleast 1 upper case"
    elif re.search(r"[0-9]", password):
        return "atleast 1 digit"
    elif re.search(r"[!@#$%^&*()(*^%$#@!~)]", password):
        return "atleast 1 upper case"
    else: True
    
    