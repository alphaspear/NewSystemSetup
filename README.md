# NewSystemSetup
bash scripts containing the code for auto install of basic apps i require

```
sudo apt install git -y
git clone https://github.com/alphaspear/NewSystemSetup.git
cd NewSystemSetup
chmod +x *.sh
/bin/bash main.sh
```

```
import requests
from requests.exceptions import RequestException
import time

def make_request(api_url, max_retries=3, delay=1):
    retries = 0

    while retries < max_retries:
        try:
            response = requests.get(api_url)
            response.raise_for_status()  # Raises an HTTPError if the HTTP request returned an unsuccessful status code
            return response.json()  # Assuming the response is in JSON format, adjust accordingly if needed
        except RequestException as e:
            print(f"Attempt {retries + 1} failed. Error: {e}")
            retries += 1
            time.sleep(delay)
    
    print(f"Max retries reached. Unable to get a successful response from {api_url}")
    return None

# Example usage:
api_endpoint = "https://example.com/api"
result = make_request(api_endpoint)

if result:
    print("Successful response:", result)
else:
    print("Failed to get a successful response after multiple attempts.")
```
