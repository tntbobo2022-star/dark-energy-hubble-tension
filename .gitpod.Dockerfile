FROM gitpod/workspace-full:latest

# نصب پکیج‌های لازم برای CLASS و MontePython
RUN sudo apt update && sudo apt install -y \
    gfortran \
    libopenmpi-dev \
    openmpi-bin \
    python3-pip \
    python3-dev \
    libfftw3-dev \
    libgsl-dev \
    git

# نصب CLASS در مسیر مشخص
RUN git clone https://github.com/lesgourg/class_public.git /workspace/class_public && \
    cd /workspace/class_public && \
    make

# نصب MontePython در مسیر مشخص
RUN git clone https://github.com/brinckmann/montepython_public.git /workspace/montepython_public && \
    cd /workspace/montepython_public && \
    pip install -r requirements.txt && \
    pip install .
