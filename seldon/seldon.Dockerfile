FROM seldonio/seldon-core-s2i-python3:0.18
ENV MODEL_NAME="seldon_model" \
    API_TYPE="REST" \
    SERVICE_TYPE="MODEL" \
    PERSISTENCE="0"
# Copying in source code
COPY . /tmp/src
RUN mv /tmp/src/seldon/* /tmp/src
# Assemble script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
RUN /s2i/bin/assemble
# Run script sourced from builder image based on user input or image metadata.
# If this file does not exist in the image, the build will fail.
CMD /s2i/bin/run
