import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

REDIRECT_PAYLOADS = [
    "https://evil.com",
    "//evil.com",
    "///evil.com",
    "https:///evil.com",
    "http://www.evil.com",
    "//www.evil.com"
]

def check_open_redirect(url):
    """Main Open Redirect Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Open Redirect",
        "risk": "Medium",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        parsed = urlparse(url)
        query = parse_qs(parsed.query)

        if not query:
            result["details"].append({"note": "No parameters found to test for Open Redirect."})
            return result

        for param in query.keys():
            for payload in REDIRECT_PAYLOADS:
                modified_query = query.copy()
                modified_query[param] = payload
                test_url = urlunparse(parsed._replace(query=urlencode(modified_query, doseq=True)))

                response = requests.get(test_url, headers=headers, timeout=7, allow_redirects=False)

                # Check if redirection is happening
                location_header = response.headers.get('Location')
                if location_header and ("evil.com" in location_header):
                    result["vulnerable"] = True
                    result["details"].append({
                        "tested_parameter": param,
                        "payload_used": payload,
                        "redirect_to": location_header,
                        "tested_url": test_url,
                        "reason": "Unvalidated redirect to external domain detected!"
                    })
                    break  # Stop after first detection

        if not result["vulnerable"]:
            result["details"].append({"note": "No Open Redirect vulnerabilities detected with basic payloads."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
