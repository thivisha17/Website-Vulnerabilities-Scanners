import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

def check_idor(url):
    """Main IDOR Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Insecure Direct Object Reference (IDOR)",
        "risk": "Medium",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        parsed = urlparse(url)
        query = parse_qs(parsed.query)

        if not query:
            result["details"].append({"note": "No URL parameters found to test for IDOR."})
            return result

        idor_test_payloads = ["9999", "1234", "0000", "1", "2"]

        for param in query.keys():
            for test_value in idor_test_payloads:
                modified_query = query.copy()
                modified_query[param] = test_value
                modified_url = urlunparse(parsed._replace(query=urlencode(modified_query, doseq=True)))

                response = requests.get(modified_url, headers=headers, timeout=7)

                # Basic weak heuristic
                if "error" not in response.text.lower() and response.status_code == 200:
                    result["vulnerable"] = True
                    result["details"].append({
                        "tested_parameter": param,
                        "tested_value": test_value,
                        "tested_url": modified_url,
                        "reason": "Potential unauthorized access without errors."
                    })
                    break  # Only show first suspicious case for each param

        if not result["vulnerable"]:
            result["details"].append({"note": "No IDOR signs found during basic tests."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
