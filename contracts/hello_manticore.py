# python3 contracts/hello_manticore.py
import os
from manticore.ethereum import ManticoreEVM

m = ManticoreEVM()

ETHER = 10**18

CONTRACT_DIR = os.path.dirname(os.path.realpath(__file__))
CONTRACT_PATH = os.path.join(CONTRACT_DIR, "HelloManticore.sol")

user_account = m.create_account(balance=1000*ETHER)
with open(CONTRACT_PATH) as f:
    contract = m.solidity_create_contract(f, owner=user_account)

### explore all functions ###
# symbolic_value = m.make_symbolic_value()
# symbolic_data = m.make_symbolic_buffer(320)
# m.transaction(
#     caller=user_account,
#     address=contract.address,
#     data=symbolic_data,
#     value=symbolic_value
# )

### explore a function ###
x = m.make_symbolic_value()
y = m.make_symbolic_value()
contract.add(x, y, caller=user_account, value=0)

print("Results are in {}".format(m.workspace))
m.finalize() # stop the exploration