from prometheus_client import start_http_server, Gauge
import Adafruit_DHT

port              = 9817
gpio_pin          = 4
dht_version       = 11
humidity_gauge    = Gauge('humidity', 'Humidity')
temperature_gauge = Gauge('temperature', 'Temperature')


start_http_server(port)
while True:
    # Try to grab a sensor reading.  Use the read_retry method which will retry up
    # to 15 times to get a sensor reading (waiting 2 seconds between each retry).
    humidity, temperature = Adafruit_DHT.read_retry(dht_version, gpio_pin)
    temperature_gauge.set(temperature)
    humidity_gauge.set(humidity)

