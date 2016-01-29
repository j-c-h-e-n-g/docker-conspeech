FROM ubuntu:trusty
MAINTAINER github@johncheng.com
RUN apt-get update -y
RUN apt-get install -y git curl python2.7 python-pip python-dev
RUN apt-get install -y python-numpy python-scipy python-sklearn python-nltk 
RUN git -C /opt clone https://github.com/valentin012/conspeech
RUN curl -o /tmp/convote_v1.1.tar.gz http://www.cs.cornell.edu/home/llee/data/convote/convote_v1.1.tar.gz
RUN cd /tmp; tar xvfz /tmp/convote_v1.1.tar.gz -C /opt/conspeech/

RUN sed -i '31 a BASEDIR = os.path.dirname(os.path.abspath(sys.argv[0]))' /opt/conspeech/demo.py
RUN sed -i '49s/"jk.p"/BASEDIR + "\/jk.p"/g'   /opt/conspeech/demo.py
# RUN sed -i '49 a jk = pickle.load( open( BASEDIR + "/jk.p", "rb" ) )'   /opt/conspeech/demo.py
RUN sed -i 's/^PATH_TO_DATA.*/PATH_TO_DATA = BASEDIR + "\/convote_v1.1\/data_stage_three"/g' /opt/conspeech/demo.py

