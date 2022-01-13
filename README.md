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
brownie test
```
To run only a specific test pass the `-k` option

```
brownie test -k test_only_owner_can_withdraw
```

## Smart Contract Lottery
Winners could get into the lottery by Eth or USD fees and then the admin selects a random winner.

How to test this?

1. `mainnet-fork`
2. `development` with mocks
3. `testnet`


Setting up the mainnet-fork, go to the https://www.alchemy.com/ create a new api key remove the old mainnet network and add the new `mainnet-fork` network to the development

```
brownie networks delete mainnet-fork


Brownie v1.17.2 - Python development framework for Ethereum

SUCCESS: Network 'mainnet-fork' has been deleted
```

Add the new network

```
 brownie networks add development mainnet-fork cmd=ganache-cli host=http://127.0.0.1 fork=https://eth-mainnet.alchemyapi.io/v2/your-api-key accounts=10 mnemonic=brownie port=8545


SUCCESS: A new network 'mainnet-fork' has been added
 ```
 Test the new network

 ```
 brownie test --network mainnet-fork 
 ```

 random lottery winner

 ```
 brownie run scripts/deploy.py 

 
Brownie v1.17.2 - Python development framework for Ethereum

SmartcontractLotteryProject is the active project.

Launching 'ganache-cli --port 8545 --gasLimit 12000000 --accounts 10 --hardfork istanbul --mnemonic brownie'...

Running 'scripts/deploy.py::main'...
Transaction sent: 0x1373d981d14f955a57b7723efdc6e089a6074de3a2f1598924608a2ebe6f5ef6
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  MockV3Aggregator.constructor confirmed   Block: 1   Gas used: 430659 (3.59%)
  MockV3Aggregator deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

Transaction sent: 0x3530001ec43f1083110101019147870a9314d87a9723d92d7510b32ba9d1f624
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  LinkToken.constructor confirmed   Block: 2   Gas used: 669124 (5.58%)
  LinkToken deployed at: 0x602C71e4DAC47a042Ee7f46E0aee17F94A3bA0B6

Transaction sent: 0x2eff4a7e1943374f91ea27870a9859a6d1a448e60f12a171ae20b52e1bb2841f
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 2
  VRFCoordinatorMock.constructor confirmed   Block: 3   Gas used: 276395 (2.30%)
  VRFCoordinatorMock deployed at: 0xE7eD6747FaC5360f88a2EFC03E00d25789F69291

Deployed!
Transaction sent: 0x65b08f9612f058af7eda6d028ec479f1ccb6a6fefb84655813336de2ee4937d3
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 3
  Lottery.constructor confirmed   Block: 4   Gas used: 897156 (7.48%)
  Lottery deployed at: 0x6951b5Bd815043E3F842c1b026b0Fa888Cc2DD85

Deployed lottery!
Transaction sent: 0x1f3629b4ccc88f7e9e8b4f9d7d7a0e3328610fafa9346bd79152467364540969
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 4
  Lottery.startLottery confirmed   Block: 5   Gas used: 28902 (0.24%)

  Lottery.startLottery confirmed   Block: 5   Gas used: 28902 (0.24%)

The lottery is started!
Transaction sent: 0x5b64596a5f9cd13211b6833b38e428007458f07407f88374a7f8118edb1fd8c0
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 5
  Lottery.enter confirmed   Block: 6   Gas used: 70995 (0.59%)

  Lottery.enter confirmed   Block: 6   Gas used: 70995 (0.59%)

You entered the lottery!
Transaction sent: 0xe930a3aa6106d132e9479441011d896ee16f7f7c6a5feffcf02436337497410a
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 6
  LinkToken.transfer confirmed   Block: 7   Gas used: 51398 (0.43%)

  LinkToken.transfer confirmed   Block: 7   Gas used: 51398 (0.43%)

Fund contract!
  LinkToken.transfer confirmed   Block: 7   Gas used: 51398 (0.43%)

Transaction sent: 0xe97361a7db515a30e3feac79b1e14d6e16abd3132949b17a82fbb83cd87bc619
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 7
  Lottery.endLottery confirmed   Block: 8   Gas used: 79626 (0.66%)

  Lottery.endLottery confirmed   Block: 8   Gas used: 79626 (0.66%)

0x0000000000000000000000000000000000000000 is the new winner!
Terminating local RPC client...
```