# hello-smart-contract-security-tools

```shell
docker pull trailofbits/eth-security-toolbox
docker run -it -v $PWD:/code trailofbits/eth-security-toolbox

solc-select 0.5.11
cd /code
```

### Echidna

```shell
echidna-test contracts/echidna/TestToken.sol
# if multiple contracts inside a file
echidna-test contracts/echidna/TestToken.sol --contract TestToken.sol

# filter functions
echidna-test contracts/echidna/Filter.sol --config config/echidna/filter.yaml

# test asserts
echidna-test contracts/echidna/Assert.sol --config config/echidna/assert.yaml

# output corpus
echidna-test contracts/echidna/Corpus.sol --config config/echidna/corpus.yaml

# find high gas consumption
echidna-test contracts/echidna/Gas.sol --config config/echidna/gas.yaml
```

### TODO

- [ ] echidna openzeppelin
- [ ] echidna vyper
