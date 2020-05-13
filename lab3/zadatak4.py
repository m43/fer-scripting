#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# m43

import re
import sys
import urllib.request


def match_host(url):
    return re.findall("[^:]://([^/]+)/?", url)


delimiter_line = "-" * 54

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Exactly two arguments need to be given. Got these:", sys.argv)
        exit(1)

    website_url = sys.argv[1]
    print('### Got url "{}"'.format(website_url))
    print("### Loading...")
    content = urllib.request.urlopen(website_url).read().decode("utf8")
    print(delimiter_line)
    print("### Website content:")
    print(content)
    print(delimiter_line)

    website_host = match_host(website_url)
    website_host = website_host[0] if website_host else ""
    hrefs = sorted(re.findall('href="([^"]+)"', content, re.I))
    hosts = {}
    print("### All hrefs:")
    for href in hrefs:
        if href.startswith("//"):
            href = "https:" + href
        elif not href.startswith("http"):
            continue
        host_matches = match_host(href)
        if len(host_matches) == 1 and host_matches[0] != website_host:
            print(href)
            host = host_matches[0]
            hosts[host] = hosts.get(host, 0) + 1
    print(delimiter_line)

    print("### Hosts counts:")
    for key, value in sorted(hosts.items(), key=lambda i: (-i[1], i[0])):
        print("Count {:>4} <--> Host {}".format(value, key))
    print(delimiter_line)

    emails = sorted(set(re.findall(r"([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)", content)))
    print("### Found {} email{}:".format(len(emails), "" if len(emails) == 1 else "s"))
    for email in emails:
        print(email)
    print(delimiter_line)

    imgsrcs = re.findall('<img [^>]*src="([^"]+)"', content, re.I)
    print("### Found {} image sources:".format(len(imgsrcs)))
    for img in imgsrcs:
        print(img)
    print(delimiter_line)
