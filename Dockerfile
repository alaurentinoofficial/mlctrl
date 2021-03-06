FROM tiangolo/uwsgi-nginx-flask-docker:python3.7


# Create the workspace
WORKDIR /app
RUN mkdir /app/output
COPY . .


# Install the pip dependencies
RUN pip install -r /app/requiments.txt


# Train the model
RUN python3 /app/model/train.py
COPY /app/output ./output


# Run the production in app
ENV ENVIROMENT PRODUCTION
RUN python3 /app/main.py