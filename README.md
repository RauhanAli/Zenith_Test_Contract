## Faucet Minter

## Repository Structure<a name="repository-structure"></a>

```
contracts
│ README.md                   // you are here
│ ...                         // setup and development configuration files
│
├─── deployements            // deployed contract addresses
├─── out                     // compiled contract files
│
├─── src                      // the contract code
│
├─── test                     // contract unit tests
│
```

### Compile Contract

```shell
$ forge build
```

## RUN ALL TESTS BSC

``forge test -vv `

## RUN SINGLE file

`forge test -vv --match-contract FaucetTest `

# Deployment Guide:

```
$ forge create --rpc-url <your_rpc_url> --private-key <your_private_key> src/Token.sol:Zenith --constructor-args "xx" "xxx" --etherscan-api-key <your_etherscan_api_key> --verify

```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```
