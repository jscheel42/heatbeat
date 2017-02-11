import shared_vars as sv
import psycopg2 as pg

# Import sensor library and read 
# import Adafruit_DHT as dht
# h,t = dht.read_retry(dht.DHT22, 4)

# Sample data for testing w/o sensor
h = 42.4231
t = 50.12345

# Connect to the DB
try:
    conn=pg.connect(dbname=sv.dbname, user=sv.dbuser, password=sv.dbpass)
    cur = conn.cursor()
except:
    print "I am unable to connect to the database."

cur.execute("INSERT INTO public.sensor_info \
    (humidity, temperature, inserted_at, updated_at) VALUES (%s, %s, %s, %s)", \
    (h, t, "now()", "now()"))

# Commit transaction and close connections
conn.commit()
cur.close()
conn.close()
