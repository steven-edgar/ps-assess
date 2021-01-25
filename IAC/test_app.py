import json
import subprocess
import os
from urllib.request import urlopen
import urllib

cur_dir = os.getcwd()

load_balancer_ingress = subprocess.run(
        [cur_dir + "/terraform", "output", "-json", "load_balancer_ingress"], 
        stdout=subprocess.PIPE, stderr=subprocess.PIPE)

lb_ip_address = json.loads(load_balancer_ingress.stdout.decode('utf-8'))[0]["ip"]

app_url = "http://" + lb_ip_address + ":5000/"
try:
      with urlopen(app_url):
          print("App tested successfully")
          print("Application can be found at " + app_url )

except urllib.error.URLError as e:
    print("ERROR - App failed, reason: " + e.reason)

