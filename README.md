# International Waste Shipments Training

| Branch  | Travis CI |
| ------------- | ------------- |
| master  | [![Build Status](https://travis-ci.com/DEFRA/international-waste-shipments-training.svg?branch=master)](https://travis-ci.com/DEFRA/international-waste-shipments-training)  |
| develop | [![Build Status](https://travis-ci.com/DEFRA/international-waste-shipments-training.svg?branch=develop)](https://travis-ci.com/DEFRA/international-waste-shipments-training)  |

This repository is a wrapper for a number of repositories that form a Node.js
based solution for the [International Waste Shipments service](https://github.com/DEFRA/prsd-iws).
This solution exists for training purposes.

## Prerequisites

### Mandatory

* Node 8.x or above
* Java 8 or above
* Maven 3.x
* Postgres 9.4

### Optional

If using Docker

* Docker 18.06 CE or later
* Docker Compose 1.22 or later

## Environment variables

| name                                           | description                                           | required | default | valid       |
|------------------------------------------------|-------------------------------------------------------|----------|---------|-------------|
| IWS_POSTGRES_CONNECTION_STRING                 | JDBC connection URL                                   | yes      |         |             |
| IWS_POSTGRES_CREATE_TABLESPACE_DIRECTORIES     | Should tablespace directories be created              | yes      |         | true, false |
| IWS_POSTGRES_INDEXES_TABLESPACE                | Tablespace name for iws database indexes              | yes      |         |             |
| IWS_POSTGRES_INDEXES_TABLESPACE_LOCATION       | Absolute path to iws tablespace directory for indexes | yes      |         |             |
| IWS_POSTGRES_PASSWORD                          | Password for postgres database user                   | yes      |         |             |
| IWS_POSTGRES_TABLES_TABLESPACE                 | Tablespace name for iws database tables               | yes      |         |             |
| IWS_POSTGRES_TABLES_TABLESPACE_LOCATION        | Absolute path to iws tablespace directory for tables  | yes      |         |             |
| IWS_POSTGRES_IWS_PASSWORD                      | Password for iws database user                        | yes      |         |             |
| IWS_POSTGRES_IWS_SCHEMA                        | iws database schema name                              | yes      |         |             |
| IWS_POSTGRES_IWS_USER                          | Username for iws database user                        | yes      |         |             |

## Local Linux Host Based Docker Build

* Ensure the required environment variables are set.
* Run ./bootstrap.sh from  the directory containing this file. This creates a Postgres 9.4 database called **iws** running in a Docker container. The
  database contains a basic schema and reference data. At present, data is not persisted between container restarts.

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

[http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3)

The following attribution statement MUST be cited in your products and applications when using this information.
