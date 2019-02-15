import requests
import base64
import hashlib

octopus_url_api = ""
api_key = ""
octopus_headers = {'X-Octopus-ApiKey': api_key}
accountName = "amber-Linux-Worker"
machineName = "linux-worker"

# Get public IP
publicIP = requests.get(url="http://169.254.169.254/latest/meta-data/public-ipv4").content


# fingerprint
line = open('/etc/ssh/ssh_host_rsa_key.pub', "r").read()
key = base64.b64decode(line.strip().split()[1].encode('ascii'))
fp_plain = hashlib.md5(key).hexdigest()
fingerprint = ':'.join(a+b for a,b in zip(fp_plain[::2], fp_plain[1::2]))

# Get account Id
request_url = octopus_url_api + "/accounts/all"
accounts = requests.get(url=request_url, headers=octopus_headers).json()
accid = ''
for acc in accounts:
    if acc["Name"] == accountName:
        accid = acc['Id']

# Get workerpool Id
request_url = octopus_url_api + "/WorkerPools/all"
workerpools = requests.get(url=request_url, headers=octopus_headers).json()
workerpoolid = ''
for wpool in workerpools:
    if wpool["Name"] == workerpoolname:
        workerpoolid = wpool["Id"]

dotNetCorePlatform = "linux-x64"
workerJson = {"Endpoint": {"CommunicationStyle": "Ssh", "AccountId": accid, "Host": publicIP, "Port": 22, "Fingerprint": fingerprint, "DotNetCorePlatform": dotNetCorePlatform}, "Name": machineName, "WorkerPoolIds": [workerpoolid]}

rurl = octopus_url_api + "/workers"
mrq = requests.post(url=rurl, json=workerJson, headers=octopus_headers)