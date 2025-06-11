import requests
from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

# Payloads we inject to try and cause SQL errors
SQLI_PAYLOADS = [
    "'", "' OR '1'='1", '" OR "1"="1"', "' OR 1=1 --", "' OR 'a'='a"
]

# Known SQL error keywords we check for
SQL_ERRORS = [
    "you have an error in your sql syntax",
    "warning: mysql",
    "unclosed quotation mark",
    "quoted string not properly terminated",
    "sqlstate",
    "syntax error"
]

def inject_payload(url, payload):
    """Injects a payload into the first parameter."""
    parsed = urlparse(url)
    query = parse_qs(parsed.query)

    if not query:
        # If no parameters, create one
        return f"{url}?test={payload}"

    # Inject into first parameter
    first_param = list(query.keys())[0]
    query[first_param] = payload
    new_query = urlencode(query, doseq=True)

    return urlunparse(parsed._replace(query=new_query))

def check_sqli(url):
    """Main SQL Injection checking function."""
    result = {
        "vulnerable": False,
        "vulnerability": "SQL Injection",
        "risk": "High",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        for payload in SQLI_PAYLOADS:
            test_url = inject_payload(url, payload)

            # Request original and injected pages
            normal_response = requests.get(url, headers=headers, timeout=7)
            injected_response = requests.get(test_url, headers=headers, timeout=7)

            # 1. Content Length Difference
            if abs(len(normal_response.text) - len(injected_response.text)) > 100:
                result["vulnerable"] = True
                result["details"].append({
                    "payload": payload,
                    "url": test_url,
                    "reason": "Content length changed significantly"
                })
                break

            # 2. SQL Error Messages Found
            if any(error in injected_response.text.lower() for error in SQL_ERRORS):
                result["vulnerable"] = True
                result["details"].append({
                    "payload": payload,
                    "url": test_url,
                    "reason": "SQL error detected in response"
                })
                break

            # 3. Unusual Server Error
            if injected_response.status_code >= 500:
                result["vulnerable"] = True
                result["details"].append({
                    "payload": payload,
                    "url": test_url,
                    "reason": f"Server responded with status {injected_response.status_code}"
                })
                break

        if not result["vulnerable"]:
            result["details"].append({"note": "No SQL Injection patterns detected."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
