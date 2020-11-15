from manticore.ethereum import ManticoreEVM

m = ManticoreEVM()

ETHER = 10**18

user_account = m.create_account(balance=1000*ETHER)
with open('example.sol') as f:
    contract = m.solidity_create_contract(f, owner=user_account)

symbolic_var = m.make_symbolic_value()
contract.f(symbolic_var)

print("Results are in {}".format(m.workspace))
m.finalize() # stop the exploration