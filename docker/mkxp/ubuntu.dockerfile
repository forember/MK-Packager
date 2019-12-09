FROM ubuntu:18.04
RUN mkdir -p /packager/output
VOLUME /packager/output
COPY ubuntu.upgrade.bash ubuntu.qmake.bash /packager/
RUN chmod +x /packager/*.bash
RUN /packager/ubuntu.qmake.bash
COPY ubuntu.deps.bash clearbinaries.bash clone.bash /packager/
RUN chmod +x /packager/*.bash
RUN /packager/ubuntu.deps.bash
RUN /packager/clone.bash
COPY ubuntu.mkdeps.bash pull.bash build.bash ubuntu.package.bash \
    ubuntu.main.bash /packager/
RUN chmod +x /packager/*.bash
COPY mkxp.txt mkxp.debctl /packager/
ENV NOPACKAGE 1
CMD /packager/ubuntu.main.bash
