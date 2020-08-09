#FROM ubuntu:focal
#
#RUN apt-get update -qq \
# && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
#    build-essential \
#    git \
#    r-base \
#    wget

#RUN Rscript \
# -e "install.packages('tinytex')" \
# -e "tinytex::install_tinytex()" \
# -e "install.packages('bookdown')" \
# -e "tinytex::tlmgr_install('koma-script')" \
# -e 'install.packages("rticles")'

#RUN apt install -y pandoc pandoc-citeproc pandoc-citeproc-preamble git

FROM btdi/bookdown

RUN apt install -y git

RUN Rscript \
 -e 'install.packages("rticles")'

WORKDIR /src
