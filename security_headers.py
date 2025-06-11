import requests

SECURITY_HEADERS = {
    "Content-Security-Policy": "Helps prevent XSS attacks",
    "Strict-Transport-Security": "Enforces HTTPS connections",
    "X-Frame-Options": "Protects against clickjacking",
    "X-Content-Type-Options": "Prevents MIME-sniffing",
    "Referrer-Policy": "Controls referrer information",
    "Permissions-Policy": "Restricts use of browser features",
    "X-XSS-Protection": "Basic XSS protection (older browsers)"
}

def check_security_headers(url):
    """Check if important security headers are set."""
    result = {
        "vulnerable": False,
        "vulnerability": "Missing Security Headers",
        "risk": "Low",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        response = requests.get(url, headers=headers, timeout=7)
        present_headers = response.headers

        missing_headers = []
        for header, description in SECURITY_HEADERS.items():
            if header not in present_headers:
                missing_headers.append({
                    "header": header,
                    "importance": description
                })

        if missing_headers:
            result["vulnerable"] = True
            for missing in missing_headers:
                result["details"].append({
                    "missing_header": missing["header"],
                    "reason": missing["importance"]
                })
        else:
            result["details"].append({"note": "All important security headers are properly set."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
