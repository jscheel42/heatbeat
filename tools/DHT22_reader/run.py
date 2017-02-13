import shared_vars as sv
import psycopg2 as pg

# Import sensor library and read 
import Adafruit_DHT as dht
h,t_c = dht.read_retry(dht.DHT22, 4)

# Sample data for testing w/o sensor
# h = 42.4231
# t_c = 50.12345

# Convert to fahrenheit
t_f = (t_c * 1.8) + 32

# Connect to the DB
try:
    conn=pg.connect(dbname=sv.dbname, user=sv.dbuser, password=sv.dbpass)
    cur = conn.cursor()
except:
    print "I am unable to connect to the database."

cur.execute("INSERT INTO public.sensors \
    (humidity, temperature, inserted_at, updated_at) VALUES (%s, %s, %s, %s)", \
    (h, t_f, "now()", "now()"))

# Commit transaction and close connections
conn.commit()
cur.close()
conn.close()
