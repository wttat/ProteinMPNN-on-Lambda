FROM public.ecr.aws/lambda/python:3.9

RUN yum install git -y
RUN git clone https://github.com/dauparas/ProteinMPNN.git ${LAMBDA_TASK_ROOT}

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

COPY app.py ${LAMBDA_TASK_ROOT}

CMD [ "app.lambda_handler" ] 