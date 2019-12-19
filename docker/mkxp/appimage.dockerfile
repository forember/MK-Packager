FROM ubuntu:18.04
RUN mkdir -p /packager/output
VOLUME /packager/output
COPY ubuntu.upgrade.bash appimage.deps.bash appimage.clone.bash /packager/
RUN chmod +x /packager/*.bash
RUN /packager/appimage.deps.bash
RUN /packager/appimage.clone.bash
COPY appimage.pull.bash appimage.repo.bash appimage.main.bash /packager/
COPY wget /usr/local/bin/
RUN chmod +x /packager/*.bash /usr/local/bin/wget
COPY AppRun mkxp.yml /packager/
CMD /packager/appimage.main.bash
