const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
// this isn't using the most recent version of web3
// new version uses promises
// was wonky in set up, so using older version just to get to the meat of development.

console.log(web3.eth.accounts)
