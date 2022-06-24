### copyright 2017-2022 Regents of the University of California and the Broad Institute. All rights reserved.
FROM genepattern/scanpyutilities:0.100

MAINTAINER Barbara Hill <bhill@broadinstitute.org>

#creating a non-root user - see above
RUN useradd -ms /bin/bash gpuser
USER gpuser
WORKDIR /home/gpuser

#switch back to root to create dir
USER root
RUN mkdir /scanpyqc \
    && chown gpuser /scanpyqc

#switch to non-root before exiting so that we don't run as root on the server, and copy all of the src files into the container.
USER gpuser
COPY module/* /scanpyqc/

CMD [ "python --version"]
# -----------------------------------

# docker build --rm https://github.com/genepattern/ScanpyQC.git#develop -f Dockerfile -t genepattern/scanpyqc:<tag>
# make sure this repo and tag match the manifest & don't forget to docker push!
# docker push genepattern/scanpyqc:<tag>

# you can use this command to run Docker and iterate locally (update for your paths and module name, of course)
# docker run --rm -it --user gpuser -v /c/Users/MyUSER/PathTo/ScanpyQC:/mnt/mydata:rw genepattern/scanpyqc:<tag> bash
