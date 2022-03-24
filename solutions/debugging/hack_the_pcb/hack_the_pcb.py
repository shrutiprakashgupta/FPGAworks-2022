from z3 import *
import json
 
print("[*] Reading the circuit")
netlist_data = open('hack_the_pcb.json')
netlist = json.load(netlist_data)
netlist_data.close()
 
netnames = []
for i in range(8):
    netnames.append("key"+str(i+1))
for i in range(19):
    if((i != 10) & (i != 13)):
        netnames.append("unlock"+str(i+1))
for i in range(32):
    netnames.append("_"+str(i)+"_")

nets = []
for i in range(len(netnames)):
    nets.append(Bool(netnames[i]))

print("[*] Modelling the Given Circuit")
netlist = netlist["modules"]["hack_the_pcb"]["cells"]
for cell in netlist:
    cell_type = netlist[cell]["type"] 
    connections = netlist[cell]["connections"]
    if(cell_type == 'NAND2X1'):
        a = connections['A'][0]
        b = connections['B'][0]
        y = connections['Y'][0]
        nets[y-2] = Not(And(nets[a-2], nets[b-2]))
        print(netnames[y-2]+" = NAND("+netnames[a-2]+", "+netnames[b-2]+")")
    elif(cell_type == 'NOR3X1'):
        a = connections['A'][0]
        b = connections['B'][0]
        c = connections['C'][0]
        y = connections['Y'][0]
        nets[y-2] = Not(Or(Or(nets[a-2], nets[b-2]),nets[c-2]))
        print(netnames[y-2]+" = NOR("+netnames[a-2]+", "+netnames[b-2]+", "+netnames[c-2]+")")
    elif(cell_type == 'NAND3X1'):
        a = connections['A'][0]
        b = connections['B'][0]
        c = connections['C'][0]
        y = connections['Y'][0]
        nets[y-2] = Not(And(And(nets[a-2], nets[b-2]),nets[c-2]))
        print(netnames[y-2]+" = NAND("+netnames[a-2]+", "+netnames[b-2]+", "+netnames[c-2]+")")
    elif(cell_type == 'AND2X2'):
        a = connections['A'][0]
        b = connections['B'][0]
        y = connections['Y'][0]
        nets[y-2] = And(nets[a-2], nets[b-2])
        print(netnames[y-2]+" = AND("+netnames[a-2]+", "+netnames[b-2]+")")
    elif(cell_type == 'INVX1'):
        a = connections['A'][0]
        y = connections['Y'][0]
        nets[y-2] = Not(nets[a-2])
        print(netnames[y-2]+" = INV("+netnames[a-2]+")")
    else: #NOR2X1
        a = connections['A'][0]
        b = connections['B'][0]
        y = connections['Y'][0]
        nets[y-2] = Not(Or(nets[a-2], nets[b-2]))
        print(netnames[y-2]+" = NOR("+netnames[a-2]+", "+netnames[b-2]+")")

print("[*] Solving the Circuit with SAT Solver")
s = []
sol = []
for i in range(17):
    s.append(Solver())
    s[i].add(nets[8+i])
    s[i].check()
    sol.append(s[i].model())

for i in sol:
    key = [0 for i in range(8)]
    for j in range(8): 
        item = i.__getitem__(j)
        val = i[item]
        if(val == True):
            key[8-int(str(item)[-1])] = '1'
        else:
            key[8-int(str(item)[-1])] = '0'
    key = int("".join(key),2)
    print(chr(key))
