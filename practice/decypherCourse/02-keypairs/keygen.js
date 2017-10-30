// EXAMPLE USAGE
// $ node ./keygen.js 016e2663fcc68b14cc7a7118567762e46c98aee81c599db4570614f60a1b079f
// > 0x3e339c825cbde351f4980eaa0bede8823285132c

const EthUtil = require("ethereumjs-util")

const hexToBytes = hex => {
  let bytes, c
  for (bytes = [], c = 0; c < hex.length; c += 2)
    bytes.push(parseInt(hex.substr(c, 2), 16));
  return bytes;
}

const privateKeyToAddress = privateKey =>
  `0x${EthUtil.privateToAddress(hexToBytes(privateKey)).toString('hex')}`

console.log(privateKeyToAddress(process.argv[2]))
