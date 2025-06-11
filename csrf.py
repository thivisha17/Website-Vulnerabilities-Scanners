import requests
from bs4 import BeautifulSoup

# Common keywords used in CSRF tokens
CSRF_KEYWORDS = ["csrf", "token", "authenticity_token", "_csrf", "_token"]

def check_csrf(url):
    """Main CSRF Checking Function."""
    result = {
        "vulnerable": False,
        "vulnerability": "Cross-Site Request Forgery (CSRF)",
        "risk": "Medium",
        "details": []
    }

    headers = {"User-Agent": "Mozilla/5.0"}

    try:
        response = requests.get(url, headers=headers, timeout=7)
        soup = BeautifulSoup(response.text, 'html.parser')
        forms = soup.find_all('form')

        if not forms:
            result["details"].append({"note": "No forms found on the page."})
            return result

        for form in forms:
            method = form.get('method', 'get').lower()

            if method == 'post':
                inputs = form.find_all('input')
                has_csrf_token = False

                for input_tag in inputs:
                    input_name = input_tag.get('name', '').lower()
                    if any(keyword in input_name for keyword in CSRF_KEYWORDS):
                        has_csrf_token = True
                        break

                if not has_csrf_token:
                    result["vulnerable"] = True
                    result["details"].append({
                        "form_action": form.get('action'),
                        "form_method": method,
                        "reason": "POST form missing CSRF protection token field"
                    })

        if not result["vulnerable"]:
            result["details"].append({"note": "All POST forms contain CSRF tokens or no POST forms found."})

    except Exception as e:
        result["details"].append({"error": str(e)})

    return result
