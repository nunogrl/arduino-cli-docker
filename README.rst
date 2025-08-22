Arduino-cli docker image
########################


What it does
============

handles the hassle of loading libraries, so you can build your stuff elsewhere.

- ideal if you don't want to keep massive libraries on your laptop.
- you're thinking on having a CI/CD at some point.


Installing extra boards
=======================

I'm using an 8266 board and I'm still figuring a best approach for this.

For the time being I'm connecting to the container and doing:
 
.. code-block:: console

    docker-compose -f docker-compose-hold.yaml -d
    docker exec -ti arduino-cli bash
    cat << EOF > ./cli-config.yaml
    board_manager:
      additional_urls:
        - "http://arduino.esp8266.com/stable/package_esp8266com_index.json"
    EOF
    arduino-cli core install esp8266:esp8266  --config-file ./.cli-config.yml

Following instructions from `here <https://gist.github.com/adi-g15/de41e96079a5b63045e86dc7c8c5c87e>`_


Installing libs
===============


I'm using a file to handle dependencies per project.

The Makefile will parse the dependencies and install if missing/outdated

.. code-block:: JSON

    {
      "config": {
        "fqbn": "esp8266:esp8266:nodemcuv2",
        "serial": "/dev/ttyUSB0"
      },
      "libs": [
        "Adafruit GFX Library",
        "Adafruit SSD1306"
      ]
    }

Usage
=====

**WIP**

.. code-block:: console

    make dependencies
    make compile
    make upload
