# Decypher Video Series Notes

## lesson 1: Development Env Setup

- testrpc gets your localhost up and running
- web3 (using `0.17.0-alpha`)is a wrapper to interact with the eth blockchain
- connect your web3 to your localhost running on test rpc with:
```
```
* note this is an older version of web3, need to research how to do this with the new version and add notes here.

## lesson 2: Creating Ethereum Keypairs
- ethereumjs-util (4.5.0): a helper library that provides some low level functions that help with cryptography

```
var Web3 = require('web3')
var web3 = new Web3
```
- ethereum private key is 64 character string. Any 64 character string is a valid private key. Exceptions: all 0s.

```
valid keys:
"1".repeat(64)
// '1111111111111111111111111111111111111111111111111111111111111111'
"1234".repeat(16)
// '1234123412341234123412341234123412341234123412341234123412341234'
"1abc".repeat(16)
'1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc1abc'
```
- caps don't matter in the private key (1abc & 1AbC are equiv)
- deterministic function that maps your private key to your public key
- if one digit is changed in private key, public key is completly different.
- private keys generate public keys
- your wallet address is the last 40 digits of your public key
- 0x is not part of the data, it's a declaration. It's declaring that it's in hex format.
- any 40digit hex string is a valid ethereum address.
- don't choose a private key that is easily guessed.

you can use sha3 through web3 to generate a 64 character hashed number
```
web3.sha3("oh my gosh I love things")
// '0x016e2663fcc68b14cc7a7118567762e46c98aee81c599db4570614f60a1b079f'
web3.sha3("oh my gosh I love thing")
// '0x295f997e461e787661a98b4eac2e4ecd0cf86bc2bee85174f81a2165f2d035e9'
web3.sha3("oh my gosh I love things")
// '0x016e2663fcc68b14cc7a7118567762e46c98aee81c599db4570614f60a1b079f'
```
