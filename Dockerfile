# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/minimal-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"
# Modified by Mikhail Klassen for Mining The Social Web, 3rd Edition

USER root

# Install Java
RUN apt-get update && apt-get install -yq default-jdk
RUN update-alternatives --config java

USER $NB_UID

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes \
    'blas=*=openblas' \
    'ipywidgets=7.2*' \
    'pandas=0.22*' \
    'numexpr=2.6*' \
    'matplotlib=2.1*' \
    'scipy=1.0*' \
    'scikit-learn=0.19*' \
    'scikit-image=0.13*' \
    'sympy=1.1*' \
    'cython=0.28*' \
    'patsy=0.5*' \
    'statsmodels=0.8*' \
    'cloudpickle=0.5*' \
    'dill=0.2*' \
    'sqlalchemy=1.2*' \
    'hdf5=1.10*' \
    'h5py=2.7*' \
    'vincent=0.4.*' \
    'beautifulsoup4=4.6.*' \
    'jpype1' \
    'protobuf=3.*' \
    'xlrd'  && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy && \
    # Activate ipywidgets extension in the environment that runs the notebook server
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    npm cache clean --force && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda clean --all --yes --quiet

# Pip install specific packages for MTSW3E
RUN pip install --upgrade setuptools
RUN pip install -q --no-cache-dir python-instagram==1.3.2 \
                   python3-linkedin==1.0.1 \
                   PyGithub==1.35 \
                   prettytable==0.7.2 \
                   Pillow==3.4.2 \
                   nltk==3.2.2 \
                   requests==2.20.0 \
                   mailbox==0.4 \
                   facebook-sdk==2.0.0 \
                   python3-linkedin==1.0.1 \
                   geopy==1.11.0 \
                   cluster==1.4.0 \
                   simplekml==1.3.0 \
                   google-api-python-client==1.6.6 \
                   feedparser==5.2.1 \
                   mailbox==0.4 \
                   envoy==0.0.3 \
                   networkx==1.11 \
                   pymongo==3.6.1 \
                   twitter-text==3.0 \
                   twitter==1.17.1 \
                   flask==0.12.3 \
                   envoy==0.0.3 \
                   html5lib==1.0.1 

RUN pip install -q --no-cache-dir charade
RUN pip install -q --no-cache-dir boilerpipe3 

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME /home/$NB_USER/.cache/
RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions /home/$NB_USER

USER root

# Download NLTK data
RUN python -m nltk.downloader -d /usr/local/share/nltk_data vader_lexicon \
                                                            stopwords \
                                                            maxent_ne_chunker \
                                                            maxent_treebank_pos_tagger \
                                                            words \
                                                            punkt \
                                                            averaged_perceptron_tagger

# Install X Virtual Framebuffer
RUN apt-get install -y xvfb
#ENV DISPLAY=:0
USER $NB_UID

# Load all the sample code and resources for Mining the Social Web, 3rd Edition
RUN rm -rf /home/$NB_USER/work
COPY matplotlibrc /home/$NB_USER/.config/matplotlib/

USER root
RUN chown $NB_UID:users /home/$NB_USER -R
RUN chmod 755 /home/$NB_USER -R
USER $NB_UID

# CMD is required by Heroku
CMD /opt/conda/bin/jupyter notebook --port=8888 --no-browser
