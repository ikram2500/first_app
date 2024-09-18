FROM python:3.8-slim 

ARG PYTHON_ENV=my_env
ENV PYTHON_ENV=$PYTHON_ENV

COPY requirements.txt set_python_env.sh /requirements.txt/

RUN bash ./requirements.txt/set_python_env.sh $PYTHON_ENV

RUN apt-get update && \
    apt-get install -y \
    vim \
    && apt update


#COPY requirements.txt .

#RUN pip install -r requirements.txt  

RUN pip install --upgrade pip

RUN mkdir -p app 

COPY ./app app 

EXPOSE 80 

CMD ["uvicorn", "app.main:app", 'host', '0.0.0.0' ,'--port', '80']