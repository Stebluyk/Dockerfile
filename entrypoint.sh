#!/bin/bash

service postgresql start && service postgresql status
service php5-fpm start && service php5-fpm status
service nginx start && service nginx status
tail
