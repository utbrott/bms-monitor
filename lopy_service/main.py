from network import Bluetooth
import pycom

bluetooth = Bluetooth()
bluetooth.set_advertisement(name='Pycom BMS', service_uuid=b'1234567890123456')

def conn_cb (bt_o):
    events = bt_o.events()   # this method returns the flags and clears the internal registry
    if events & Bluetooth.CLIENT_CONNECTED:
        print("Device connected")
    elif events & Bluetooth.CLIENT_DISCONNECTED:
        print("Device disconnected")

def send_data_handler(chr, data):
    events, value = data
    if events & Bluetooth.CHAR_READ_EVENT:
        print('Data read request')

bluetooth.callback(trigger=Bluetooth.CLIENT_CONNECTED | Bluetooth.CLIENT_DISCONNECTED, handler=conn_cb)
bluetooth.advertise(True)

serv1 = bluetooth.service(uuid=0x00010001, isprimary=True)
char1 = serv1.characteristic(uuid=0x0002, value=0x0111)
char1_cb = char1.callback(trigger=Bluetooth.CHAR_READ_EVENT, handler=send_data_handler)
