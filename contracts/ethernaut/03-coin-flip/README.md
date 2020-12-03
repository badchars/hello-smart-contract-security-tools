```shell
echidna-test contracts/ethernaut/03-coin-flip/test.sol --contract Test --config contracts/ethernaut/03-coin-flip/config.yaml

                                             ┌─────────────────────────────────────────────────────Echidna 1.5.1────────────────────────────────────────────────────┐
                                             │ Tests found: 1                                                                                                       │
                                             │ Seed: -1146007090576119758                                                                                           │
                                             │─────────────────────────────────────────────────────────Tests────────────────────────────────────────────────────────│
                                             │ echidna_test_coin_flip: FAILED!                                                                                      │
                                             │                                                                                                                      │
                                             │ Call sequence:                                                                                                       │
                                             │ 1.flip(false) Time delay: 0xcfc9 Block delay: 0x9f83                                                                 │
                                             │ 2.flip(false) Gas price: 0x21d158c3b Time delay: 0x72abd Block delay: 0x665c                                         │
                                             │ 3.flip(true) Time delay: 0x13fa1 Block delay: 0x6d2f                                                                 │
                                             │ 4.flip(false) Time delay: 0x90cb5 Block delay: 0x45b6                                                                │
                                             │ 5.flip(false) Time delay: 0x83aae Block delay: 0x8cea                                                                │
                                             │ 6.flip(false) Time delay: 0x22ae4 Block delay: 0x8f72                                                                │
                                             │ 7.flip(false) Time delay: 0x35b95 Block delay: 0xd798                                                                │
                                             │ 8.flip(false) Time delay: 0x726d4 Block delay: 0x8c65                                                                │
                                             │ 9.flip(false) Time delay: 0x7c2a2 Block delay: 0x6d60                                                                │
                                             └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```
