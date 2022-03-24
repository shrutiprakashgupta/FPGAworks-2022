import numpy as np

vcd_file = open("/home/shruti/Documents/FPGAworks/challenges/debugging/lets_eavesdrop/attachment/lets_eavesdrop.vcd", 'r')
vcd_data = vcd_file.readlines()

def get_signal_data(symbol, vcd_data):
    signal_data = []
    changed = 0
    for line in vcd_data:
        if(line[0] == "#"):
            if(changed == 0):
                signal_data.append(signal_data[-1])
            changed = 0
        else:
            if(symbol in line):
                if(symbol != line[0]):
                    signal_data.append(line.split(symbol)[0])
                    changed = 1
    signal_data = signal_data[1:]
    if "b" in signal_data[0]:
        signal_data = [int(data[1:-1],2) for data in signal_data]
    else:
        signal_data = [int(data) for data in signal_data]
    return signal_data

# Read signal dump from the vcd file 
i = 0
for line in vcd_data:
    if "dumpvars" in line:
        break
    else:
        i = i + 1
vcd_data = vcd_data[i+1:]

pclk = get_signal_data("!", vcd_data)
preset_n = get_signal_data("\"", vcd_data)
psel = get_signal_data("#", vcd_data)
paddr = get_signal_data("$", vcd_data)
penable = get_signal_data("%", vcd_data)
prdata = get_signal_data(")", vcd_data)
trans_type = get_signal_data("-", vcd_data)

read = 0
data = {}
for i in range(len(psel)):
    if(pclk[i]):
        if(psel[i] & penable[i] & preset_n[i]):
            if(trans_type[i] == 1):
                read = 1
                addr = int(paddr[i]/4)
        if(read):
            data[addr]= prdata[i]
            read = 0
known_addr = np.sort(np.array(list(data.keys()), dtype=int))
flag = []
for addr in known_addr:
    flag.append(chr(data[addr]))
print("".join(flag))
