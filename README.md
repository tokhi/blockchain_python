## Brownie simple storage
Compile the simple storage using

```
brownie compile
```
Execute the deployment scipt with the local development or rinkeby network. Run the `brownie networks list` to see the available network.

```
brownie run scripts/deploy.py --network development
```

## Brownie fund me
 start the docker container using the make file terminal and then cd to the `brownie_fund_me` directory.

 Add the the local ganache to the Ethereum network
 ```
 brownie networks add Ethereum ganache-local host=http://127.0.0.1:8545 chainid=1337
 ```

 Start the ganache-cli:

 ```
 # --deterministic option ensures you get the same private keys everytime you run the ganache-cli
 ganache-cli --deterministic &
 ```
 Then run the deploy script

 ```
 brownie run scripts/deploy.py --network ganache-local
 ```

 This is the output that you gonna get:

 ```
Brownie v1.17.2 - Python development framework for Ethereum

BrownieFundMeProject is the active project.
web3_clientVersion
eth_getBlockByNumber
eth_accounts
eth_getCode
eth_getCode

Running 'scripts/deploy.py::main'...
The active network is ganache-local
Deploying Mocks...
Mocks Deployed!
eth_gasPrice
eth_estimateGas
eth_getBlockByNumber
eth_getTransactionCount
eth_call
eth_gasPrice
eth_getBlockByNumber
eth_sendTransaction
Transaction sent: 0x14c7302399b7e9103f74ca3b5a59a6fc9e97cfcc24ec35c574745602fe014ee8

  Transaction: 0x14c7302399b7e9103f74ca3b5a59a6fc9e97cfcc24ec35c574745602fe014ee8
  Contract created: 0xc89ce4735882c9f0f0fe26686c53074e09b0d550
  Gas usage: 405093
  Block Number: 5
  Block Time: Thu Dec 30 2021 13:29:34 GMT+0000 (Coordinated Universal Time)

eth_getTransactionByHash
  Gas price: 20.0 gwei   Gas limit: 445602   Nonce: 4
eth_getTransactionCount
eth_getTransactionReceipt
  FundMe.constructor confirmed   Block: 5   Gas used: 405093 (90.91%)
  FundMe deployed at: 0xC89Ce4735882C9F0f0FE26686c53074E09B0D550

eth_getCode
eth_getCode
eth_blockNumber
Contract deployed to 0xC89Ce4735882C9F0f0FE26686c53074E09B0D550
```

### Brownie fund me and withdraw 

To run the script execute the command below

```
brownie run scripts/fund_and_withdraw.py --network ganache-local

```

expected output with the fund me and withdraw confirmation:

```
Brownie v1.17.2 - Python development framework for Ethereum

BrownieFundMeProject is the active project.
web3_clientVersion
eth_getBlockByNumber
eth_accounts
eth_getCode
eth_getCode
eth_getCode

Running 'scripts/fund_and_withdraw.py::main'...
eth_call
25000000000000000
The current entry fee is 25000000000000000
Funding
eth_gasPrice
eth_estimateGas
eth_getBlockByNumber
eth_getTransactionCount
eth_call
eth_gasPrice
eth_getBlockByNumber
eth_sendTransaction
Transaction sent: 0x4f2fba193b430b6c1dd2e4814c0a814d7a75973e7e02ba790289cbfee66c53f5

  Transaction: 0x4f2fba193b430b6c1dd2e4814c0a814d7a75973e7e02ba790289cbfee66c53f5
  Gas usage: 90235
  Block Number: 6
  Block Time: Thu Dec 30 2021 13:32:00 GMT+0000 (Coordinated Universal Time)

eth_getTransactionByHash
  Gas price: 20.0 gwei   Gas limit: 99258   Nonce: 5
eth_getTransactionCount
eth_getTransactionReceipt
  FundMe.fund confirmed   Block: 6   Gas used: 90235 (90.91%)

eth_gasPrice
eth_estimateGas
eth_getTransactionCount
eth_call
eth_gasPrice
eth_getBlockByNumber
eth_sendTransaction
Transaction sent: 0xb01522323ff46160aa063e6cf2607b7442b8c946109ebe7e6a0be79f39e8530f

  Transaction: 0xb01522323ff46160aa063e6cf2607b7442b8c946109ebe7e6a0be79f39e8530f
  Gas usage: 24967
  Block Number: 7
  Block Time: Thu Dec 30 2021 13:32:01 GMT+0000 (Coordinated Universal Time)

eth_getTransactionByHash
  Gas price: 20.0 gwei   Gas limit: 76963   Nonce: 6
eth_getTransactionCount
eth_getTransactionReceipt
  FundMe.withdraw confirmed   Block: 7   Gas used: 24967 (32.44%)
  ```

### Run the test
```
brownie test`
```
To run only a specific test pass the `-k` option

```
brownie test -k test_only_owner_can_withdraw
```