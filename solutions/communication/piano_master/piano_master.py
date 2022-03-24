import serial

#Configure Port
ser = serial.Serial()
ser.baudrate = 115200
ser.port = 'COM9'
ser.bytesize = serial.EIGHTBITS
ser.parity   = serial.PARITY_NONE
ser.stopbits = serial.STOPBITS_ONE
ser.xonxoff  = 0

#Open Port
if(ser.is_open == False):
	ser.open()
print("Port Open")

#Write anything random to activate the port
ser.write(b'\x00')
while True:
	c = ser.readline()
	print(c)
	ser.write(c[1].to_bytes(1, 'big'))
	if(len(c) > 5):
		break
ser.close()
