import os
from manticore.ethereum import ManticoreEVM, ABI
from manticore.core.smtlib import Operators, solver

m = ManticoreEVM()

ETHER = 10**18

CONTRACT_DIR = os.path.dirname(os.path.realpath(__file__))
CONTRACT_PATH = os.path.join(CONTRACT_DIR, "Simple.sol")

user_account = m.create_account(balance=1000*ETHER)
with open(CONTRACT_PATH) as f:
    contract = m.solidity_create_contract(f, owner=user_account)

## explore all functions ###
symbolic_value = m.make_symbolic_value()
symbolic_data = m.make_symbolic_buffer(320)

m.transaction(
    caller=user_account,
    address=contract.address,
    data=symbolic_data,
    value=symbolic_value
)

bug_found = False
# only return "RETURN" states
for state in m.ready_states:
    last_tx = state.platform.transactions[-1]
    # print(last_tx.result)
    x = state.platform.transactions[-1].return_data
    x = ABI.deserialize("uint", x)

    # Check if x != 123
    condition = x != 123
    if m.generate_testcase(state, name="BugFound", only_if=condition):
        print("Bug found! see {}".format(m.workspace))
        bug_found = True

if not bug_found:
    print("No bug found")
