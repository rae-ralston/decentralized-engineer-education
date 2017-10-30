const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))
const web3 = new Web3('http://localhost:8545')

// $ web3.eth.accounts[0]
// > '0x15aece296633c7c4d9e9ab15b24fd85535cb1fbd'

// $ web3.eth.getBalance(web3.eth.accounts[0])
// > { [String: '100000000000000000000'] s: 1, e: 20, c: [ 1000000 ] }

// $ web3.fromWei(web3.eth.getBalance(web3.eth.accounts[0]), 'ether').toNumber
// > 100

const acct1 = web3.eth.accounts[0]
const acct2 = web3.eth.accounts[1]

const balance = acct => web3.fromWei(web3.eth.getBalance(acct), 'ether').toNumber()
console.log(balance(acct1))

const txHash = web3.eth.sendTransaction({from: acct1, to: acct2, value: web3.toWei(1, 'ether'), gasLimit: 21000, gasPrice: 20000000000})
// returns txHash: '0xa55200b078a8bd975855ce8b1d370e51118db93b452192e83d6418aa32c2bb9f'
// how much gas is gas used * gas price (to do the math, convert used gas to wei, multiply by gas price)

console.log(web3.eth.getTransaction(txHash))
// { hash: '0xa55200b078a8bd975855ce8b1d370e51118db93b452192e83d6418aa32c2bb9f',
//   nonce: 0,
//   blockHash: '0x70bd88a1de07a404c055d3c6aadd0e17e38ded1118804a8775d118c13121ad60',
//   blockNumber: 1,
//   transactionIndex: 0,
//   from: '0x15aece296633c7c4d9e9ab15b24fd85535cb1fbd',
//   to: '0x26ebe480c5d4a676f809a5a2414c8f1c93752367',
//   value: { [String: '1000000000000000000'] s: 1, e: 18, c: [ 10000 ] },
//   gas: 90000,
//   gasPrice: { [String: '20000000000'] s: 1, e: 10, c: [ 20000000000 ] },
//   input: '0x0' }


// Nonce is to keep duplicate transactions from going on the blockchain, it's kind of like an id
// autoincrimenting id
// same account cannot have the same nonce twice
