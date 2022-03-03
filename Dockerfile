FROM python:3.9
WORKDIR /app
COPY . ./app
ENV ARTIFACT_ROOT={ARTIFACT_ROOT}    
ENV AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=oamlflow;AccountKey=S4+OeMb7LRawrJP31uTc/hx+WCbvShSBPmZx4WJhFiRFt+edlQXjg2ey4OrtarYA8K40a8SPVGQxPe3mTYrmrA==;EndpointSuffix=core.windows.net"
RUN pip install --upgrade pip
RUN pip install -r ./app/requirements.txt
EXPOSE 5000

CMD ["mlflow", "server", "--host", "0.0.0.0", "--default-artifact-root", "wasbs://test@oamlflow.blob.core.windows.net"]
