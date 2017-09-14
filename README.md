# Booking System [![Codacy Badge](https://api.codacy.com/project/badge/Grade/83c5e7a536e64026a404ad84cf561722)](https://www.codacy.com/app/bramvanosta/Booking-System?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=Bramvanosta/Booking-System&amp;utm_campaign=Badge_Grade) [![Build Status](https://travis-ci.org/Bramvanosta/Booking-System.svg?branch=master)](https://travis-ci.org/Bramvanosta/Booking-System)

## Includes
- [Rails 5.1.3](http://rubyonrails.org/) API with [PostgreSQL](https://www.postgresql.org/) database
- [Angular 4.3.6](https://angular.io/) client

## Dependencies
- [Docker](https://docs.docker.com/engine/installation/) & [Docker-compose](https://docs.docker.com/compose/install/)

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/Bramvanosta/Booking-System.git
    ```
2. Build and launch the docker containers:
    ```bash
    docker-compose up -d
    ```  
3. Prepare the environments:
    ```bash
    ./scripts/installDevelopment.sh
    ``` 
4. Point the container's IP address to the right hosts by adding these three lines to the `/etc/hosts` file:
    ```bash
    127.0.0.1       api.booking-system.dev
    127.0.0.1       booking-system.dev
    ```
5. You can now access the following urls:
    * **api.booking-system.dev** for the Rails API
    * **booking-system.dev:4200** for the Angular client with live reloading
