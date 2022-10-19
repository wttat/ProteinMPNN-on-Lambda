# FROM ubuntu:20.04

# WORKDIR "/app"

# RUN apt update \
#     && apt install python3-pip git -y \
#     && pip3 install torch torchvision torchaudio

# RUN git clone https://github.com/dauparas/ProteinMPNN.git 

# COPY run.sh .
# COPY relaxed_model_1_pred_0.pdb .
# RUN chmod +x run.sh

# CMD ["/app/run.sh"]

#######
#######

FROM public.ecr.aws/lambda/python:3.9

RUN yum install git -y
RUN git clone https://github.com/dauparas/ProteinMPNN.git ${LAMBDA_TASK_ROOT}

COPY requirements.txt  .
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

COPY app.py ${LAMBDA_TASK_ROOT}
COPY relaxed_model_1_pred_0.pdb ${LAMBDA_TASK_ROOT}

CMD [ "app.lambda_handler" ] 