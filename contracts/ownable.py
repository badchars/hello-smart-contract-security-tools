from manticore.ethereum import ManticoreEVM
from manticore.ethereum.abi import ABI
from manticore.core.smtlib import Operators

m = ManticoreEVM()

ETHER = 10**18

owner = m.create_account(balance=1000*ETHER)
attacker = m.create_account(balance=1000*ETHER)

with open('Ownable.sol') as f:
    contract = m.solidity_create_contract(f, owner=owner)

# addr = m.make_symbolic_address()
# contract.setOwner(addr, caller=owner, value=0)
# contract.owner()

symbolic_value = m.make_symbolic_value()
symbolic_data = m.make_symbolic_buffer(320)
m.transaction(
    caller=attacker,
    address=contract.address,
    data=symbolic_data,
    value=symbolic_value
)
contract.owner()

bug_found = False
for state in m.all_states:
    tx = state.platform.transactions[-1]
    if tx.result in ["REVERT", "INVALID"]:
        continue

    new_owner = ABI.deserialize("address", tx.return_data)

    print(owner, new_owner)

    condition = new_owner != owner
    if m.generate_testcase(state, name="Pwn", only_if=condition):
        print(new_owner, owner)
        print(f'Pwn! see {m.workspace}')
        bug_found = True

if not bug_found:
    print("No bug found")