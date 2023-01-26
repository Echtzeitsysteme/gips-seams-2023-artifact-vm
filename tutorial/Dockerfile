# Dockerfile to create a Pandoc render image with Eisvogel template installed

FROM maxkratz/texlive:2022
LABEL maintainer="Maximilian Kratz <maximilian.kratz@es.tu-darmstadt.de>"
ENV DEBIAN_FRONTEND=noninteractive

# Update and install various packages
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq \
        pandoc zip

RUN mkdir -p /root/.pandoc/templates
COPY Eisvogel.zip /tmp
RUN cd /tmp && unzip Eisvogel.zip && mv /tmp/eisvogel.latex /root/.pandoc/templates
RUN rm -rf /tmp/*

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

CMD ["bash"]

