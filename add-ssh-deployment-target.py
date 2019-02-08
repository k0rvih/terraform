import requests

octopus_url_api = ""
api_key = ""
octopus_headers = {'X-Octopus-ApiKey': api_key}
envName="testssh"
accountName="amber-Linux-Worker"
machineName="linuxworker"

# publicHostName = requests.get(url="http://169.254.169.254/latest/meta-data/public-ipv4").content
publicHostName = "184.72.90.47"

# fingerprint
fingerprint = "a3:13:67:64:cb:d3:68:c5:64:b3:f4:27:06:93:5f:45"

# Get environment Id
request_url = octopus_url_api + "environments/all"
envs = requests.get(url=request_url, headers=octopus_headers).json()
envid = ''
for env in envs:
    if env["Name"] == envName:
        envid = env['Id']

# Get account Id
request_url = octopus_url_api + "accounts/all"
accounts = requests.get(url=request_url, headers=octopus_headers).json()
accid = ''
for acc in accounts:
    if acc["Name"] == accountName:
        accid = acc['Id']


dotNetCorePlatform = "linux-x64" # Valid values are 'linux-x64' or 'osx-x64'.
machineJson = {"Endpoint": {"CommunicationStyle": "Ssh", "AccountId": accid, "Host": publicHostName, "Port": 22, "Fingerprint": fingerprint, "DotNetCorePlatform": dotNetCorePlatform}, "EnvironmentIds": [envid], "Name": machineName, "Roles": ["linux"]}

rurl = octopus_url_api + "/machines"
mrq = requests.post(url=rurl, json=machineJson, headers=octopus_headers)
print(mrq)