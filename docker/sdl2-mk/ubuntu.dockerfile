FROM ubuntu:18.04
RUN mkdir -p /packager/output
VOLUME /packager/output
COPY ubuntu.upgrade.bash ubuntu.scm.bash modsdl.bash bootstrap.bash \
    clearbinaries.bash clone.bash /packager/
RUN chmod +x /packager/*.bash
RUN /packager/ubuntu.scm.bash
RUN /packager/clone.bash
COPY ubuntu.deps.bash /packager/
RUN chmod +x /packager/*.bash
RUN /packager/ubuntu.deps.bash
COPY pull.bash build.bash ubuntu.package.bash ubuntu.main.bash /packager/
RUN chmod +x /packager/*.bash
COPY packages/*.txt packages/*.debctl /packager/
ENV NOPACKAGE 0
CMD /packager/ubuntu.main.bash
