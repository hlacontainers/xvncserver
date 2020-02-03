#
# Copyright 2020 Tom van den Berg (TNO, The Netherlands).
# SPDX-License-Identifier: Apache-2.0
#

FROM ubuntu:18.04

# Get xvfb as X Server and x11vnc as VNC Server
RUN apt-get update && apt-get install -y xvfb x11vnc x11-xserver-utils
				
# Use this display number
ENV DISPLAY :0.0

# Expose VNC and X11 ports
EXPOSE 5900 6000

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
