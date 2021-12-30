FROM python:3.9-alpine

# Set up code directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install linux dependencies
#RUN apt-get update && apt-get install -y libssl-dev
RUN apk add --no-cache gcc musl-dev linux-headers tk bash
RUN apk add --no-cache npm

RUN npm install -g ganache-cli

COPY . ./ 
RUN pip install -r requirements.txt
#RUN python -m pip install --user pipx
#RUN pipx install eth-brownie
#RUN pipx ensurepath
RUN pip install eth-brownie



WORKDIR /home
