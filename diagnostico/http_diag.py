import requests

r = requests.get("https://api.github.com")

print(r.content)

print(b'fernandofiore310' in r.content)