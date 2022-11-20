#!/usr/bin/env python3 -tt

def main():
    content = '-Dlog4j2.formatMsgNoLookups=true\n-Xms4g\n-Xmx4g\n'
    with open("/etc/elasticsearch/jvm.options.d/jvm.options", "w") as jvmoptions:
        jvmoptions.write(content)

if __name__ == "__main__":
    main()