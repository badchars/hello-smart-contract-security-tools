from manticore.ethereum import ManticoreEVM

m = ManticoreEVM()

ETHER = 10**18
# need Ether to deploy contract
user_account = m.create_account(balance=1000 * ETHER)
with open("TestSafeMath.sol") as f:
    contract = m.solidity_create_contract(f, owner=user_account, contract_name="TestSafeMath")

x = m.make_symbolic_value()
y = m.make_symbolic_value()
contract.test_add(x, y)

print("Results are in {}".format(m.workspace))
m.finalize() # stop the exploration