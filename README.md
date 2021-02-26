# hello-smart-contract-security-tools

```shell
docker pull trailofbits/eth-security-toolbox
docker run -it --rm -v $PWD:/code trailofbits/eth-security-toolbox

solc-select 0.5.11
cd /code
```

### Install Vyper

```shell
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py
pip install vyper
```

### Slither

```shell
# slither analysis
slither --exclude-dependencies .

# quick review
slither . --print human-summary

slither . --print inheritance-graph
xdot contracts.dot

slither . --print contract-summary

# in-depth review
slither . --print call-graph
slither . --print cfg
slither . --print function-summary
slither . --print vars-and-auth

# tools
## check ERC
slither-check-erc contract.sol contractName
## auto generate Echinda tests for ERC20 contract
slither-prop contract.sol --contract contractName

```

### Echidna

```shell
echidna-test contracts/echidna/TestToken.sol
# if multiple contracts inside a file
echidna-test contracts/echidna/TestToken.sol --contract TestToken

# filter functions
echidna-test contracts/echidna/Filter.sol --config config/echidna/filter.yaml

# test asserts
echidna-test contracts/echidna/Assert.sol --config config/echidna/assert.yaml

# output corpus
echidna-test contracts/echidna/Corpus.sol --config config/echidna/corpus.yaml

# find high gas consumption
echidna-test contracts/echidna/Gas.sol --config config/echidna/gas.yaml
```

### Manticore

```shell
# install

virtualenv -p python3 venv
source venv/bin/activate
pip3 install -r requirements.txt
```

```shell
# cli
manticore <folder or file>
manticore contract.sol --quick-mode --contract MyContract

# python
cd contracts/manticore
python3 example_run.py
```

### Manticore Verifier

```shell
manticore-verifier contracts/manticore-verifier/TestToken.sol --contract TestToken
```

### TODO

- [ ] echidna openzeppelin
- [ ] echidna vyper
