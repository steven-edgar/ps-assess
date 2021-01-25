#!/bin/python3

#
# NOTES
# =======
# This implements a very basic method to retrieve all products
# from reqres.in and return them over an HTTP connection as
# a simple table. 
# Note this uses a web server suitable for DEBUGGING only. 
# Production use would see this replaced with a suitable 
# frontend mechaism. 

import json
from urllib.request import urlopen, Request
import urllib
from json2html import *
from flask import Flask

class Config(object):
    SECRET_KEY = "fth6tvyj5trbty45sdfbe56yrth"

app = Flask(__name__)
app.config.from_object(Config)


@app.route("/")
def list_all_products():
    page = 1
    last_page = 1
    prod_url = 'https://reqres.in/api/products/?page='
    headers = {'User-Agent': 'python'}
    all_products = []

    while page <= last_page:
        try:
            with urlopen(Request(prod_url + str(page), headers=headers)) as content:
                parsed_json = (json.loads(content.read()))
                last_page = parsed_json["total_pages"]
                all_products.extend(parsed_json["data"])
        except urllib.error.URLError as e:
            print(e.reason)

        page += page

    return(json2html.convert(json = all_products))

if __name__ == "__main__":
    app.run(host='0.0.0.0')

