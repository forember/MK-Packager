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
COPY mkxp.debctl mkxp-launch mkxp.png mkxp.desktop /packager/
ENV NOPACKAGE 0
CMD /packager/ubuntu.main.bash
