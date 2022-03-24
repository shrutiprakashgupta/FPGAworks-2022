from pylfsr import LFSR 
from math import log
import serial

# Find the LFSR size
# Returns -1 if given number of samples is not sufficient to determine the size of LFSR
def find_lfsr_size(data, period_len):
	for i in range(period_len,1,-1):
		mega_found = 1
		find_block = data[:i]
		for j in range(i, len(data) - len(data)%i, i):
			curr_block = data[j: i + j]
			if  curr_block != find_block:
				mega_found = 0
				break
		if mega_found:
			size = log(i + 1, 2)
			if int(size) == size:
				return int(size)
	return -1

#Configure Port
ser = serial.Serial()
ser.baudrate = 460830 
ser.port = 'COM9'
ser.bytesize = serial.EIGHTBITS
ser.parity   = serial.PARITY_NONE
ser.stopbits = serial.STOPBITS_ONE
ser.xonxoff  = 0

#Open Port
if(ser.is_open == False):
	ser.open()
print("Port Open")

i = 0
size = 0
data = []
while True:
	min_samples = 2**i + 20
	data = []
	for j in range(min_samples):
		c = ser.read()
		if len(c) == 0:
			break
		data.append(c.decode("utf-8"))
	data = "".join(data)

	size = find_lfsr_size(data, len(data)//2)
	if(size > -1):
		print("Size: "+str(size))
		break
	i = i + 1
ser.close()

# Check all polynomials for given size and match with the output
samples = 2**size
data = "".join(list(data)[:samples])

L = LFSR() 
possible_poly = L.get_fpolyList(m=size)
k = 2**(size+1) 
for poly in possible_poly:
	L = LFSR(fpoly=poly)
	possible_data = list(map(str, L.runKCycle(k)))
	for i in range(samples):
		if(data == "".join(possible_data[i:i+samples])):
			print("Poly : " + str(poly))
