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


```
import requests
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry

# Suppress SSL warnings
requests.packages.urllib3.disable_warnings(requests.packages.urllib3.exceptions.InsecureRequestWarning)

def make_request(url):
    try:
        response = requests.get(url, verify=False)  # verify=False suppresses SSL warnings
        response.raise_for_status()  # Raise an HTTPError for bad responses

        return response.text
    except requests.exceptions.HTTPError as errh:
        print(f"HTTP Error: {errh}")
    except requests.exceptions.ConnectionError as errc:
        print(f"Error Connecting: {errc}")
    except requests.exceptions.Timeout as errt:
        print(f"Timeout Error: {errt}")
    except requests.exceptions.RequestException as err:
        print(f"An error occurred: {err}")

    return None

def retry_request(url, max_retries=3):
    retries = Retry(total=max_retries, backoff_factor=1, status_forcelist=[500, 502, 503, 504])
    adapter = HTTPAdapter(max_retries=retries)
    session = requests.Session()
    session.mount('https://', adapter)

    for attempt in range(1, max_retries + 1):
        print(f"Attempt {attempt}:")
        result = make_request(url)

        if result:
            print(f"Success! Response: {result}")
            break

        print("Retrying...\n")

# Example usage
api_url = "https://your-api-endpoint.com"
retry_request(api_url)
```
