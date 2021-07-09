FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
WORKDIR /root
USER root
#RUN useradd -U -m -s /bin/bash joystream --uid=1001 && \
#echo "joystream:docker" | chpasswd
#RUN usermod -aG sudo joystream
#WORKDIR /home/joystream
#USER joystream
#COPY --chown=joystream:joystream joystream-node /home/joystream/
COPY joystream-node .
#COPY --chown=joystream:joystream joy-testnet-5.json /home/joystream/
COPY joy-testnet-5.json .
#COPY --chown=joystream:joystream joystreamsetup.sh .
COPY joystreamsetup.sh .
RUN ./joystreamsetup.sh
ENTRYPOINT ["/root/joystream-node"]
EXPOSE 9944 9615 30333

