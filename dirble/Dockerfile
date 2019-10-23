FROM isona/dirble

# Build dict
RUN apt-get update && apt-get install -y git \
        && git clone https://github.com/milo2012/pathbrute.git \
        && cat pathbrute/dev/* pathbrute/*.txt dirble_wordlist.txt | sort -u | sed 's/^\///' > custom_wordlist.txt \
        && rm -rf pathbrute/ && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./dirble"]
