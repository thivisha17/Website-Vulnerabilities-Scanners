from urllib.parse import urlparse, parse_qs, urlencode, urlunparse

def inject_payload(url, payload):
    parsed = urlparse(url)
    query = parse_qs(parsed.query)
    if not query:
        return f"{url}?param={payload}"
    first_param = list(query.keys())[0]
    query[first_param] = payload
    new_query = urlencode(query, doseq=True)
    return urlunparse(parsed._replace(query=new_query))
