```shell
echidna-test contracts/ethernaut/11-elevator/test.sol --contract Test --config contracts/ethernaut/11-elevator/config.yaml

                                             ┌─────────────────────────────────────────────────────Echidna 1.5.1────────────────────────────────────────────────────┐
                                             │ Tests found: 1                                                                                                       │
                                             │ Seed: -8528507364057628707                                                                                           │
                                             │─────────────────────────────────────────────────────────Tests────────────────────────────────────────────────────────│
                                             │ echidna_test_floor: FAILED!                                                                                          │
                                             │                                                                                                                      │
                                             │ Call sequence:                                                                                                       │
                                             │ 1.isLastFloor_value([false, true, false, false, true])                                                               │
                                             │ 2.pwn(0)                                                                                                             │
                                             └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```
