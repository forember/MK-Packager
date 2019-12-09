FROM ubuntu:18.04
RUN mkdir -p /packager/output
VOLUME /packager/output
COPY ubuntu.upgrade.bash ubuntu.deps.bash clearbinaries.bash clone.bash \
    /packager/
RUN chmod +x /packager/*.bash
RUN /packager/ubuntu.deps.bash
RUN /packager/clone.bash
COPY pull.bash build.bash ubuntu.package.bash ubuntu.main.bash /packager/
RUN chmod +x /packager/*.bash
COPY physfs.txt physfs-dev.txt physfs.debctl physfs-dev.debctl /packager/
ENV NOPACKAGE 0
CMD /packager/ubuntu.main.bash