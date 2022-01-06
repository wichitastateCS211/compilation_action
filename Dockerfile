FROM fedora:35
LABEL Name=llvm
WORKDIR /root

SHELL ["/bin/bash", "-o", "pipefail", "-l", "-c"]
# RUN sed -i '/^tsflag*/d' /etc/dnf/dnf.conf

RUN dnf -y upgrade && \
    dnf install -y \
        clang \
        clang-devel \
        clang-tools-extra \
        cmake \
        git \
        libcxx \
        libcxx-devel \
        libcxxabi \
        libcxxabi-devel \
        lld \
        lld-devel \
        lldb \
        lldb-devel \
        llvm \
        llvm-devel \
        ninja-build && \
        echo "alias clang++=\"clang++ -Wall -Wextra -std=c++17 -stdlib=libc++ -fuse-ld=lld\"" \
            >> /root/.bashrc

CMD ["/bin/bash"]
