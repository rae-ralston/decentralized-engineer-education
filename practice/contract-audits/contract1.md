# notes from [ethereum online compiler](https://remix.ethereum.org)

1. Potential Violation of Checks-Effects-Interaction pattern in InsecureAndMessy.withdraw(): Could potentially lead to re-entrancy vulnerability. [more](http://solidity.readthedocs.io/en/develop/security-considerations.html#re-entrancy)

1. browser/ballot.sol:[22:10, 36:10]: use of "send": "send" does not throw an exception when not successful, make sure you deal with the failure case accordingly. Use "transfer" whenever failure of the ether transfer should rollback the whole transaction. Note: if you "send/transfer" ether to a contract the fallback function is called, the callees fallback function is very limited due to the limited amount of gas provided by "send/transfer". No state changes are possible but the callee can log the event or revert the transfer. "send/transfer" is syntactic sugar for a "call" to the fallback function with 2300 gas and a specified ether value. [more](http://solidity.readthedocs.io/en/develop/security-considerations.html#sending-and-receiving-ether)

1. Fallback function of contract browser/ballot.sol:InsecureAndMessy requires too much gas (20230).
If the fallback function requires more than 2300 gas, the contract cannot receive Ether.

1. Gas requirement of function browser/ballot.sol:InsecureAndMessy[.addShareholder(address), .dispense(), .withdraw()  ] unknown or not constant.
If the gas requirement of a function is higher than the block gas limit, it cannot be executed. Please avoid loops in your functions or actions that modify large areas of storage (this includes clearing or copying arrays in storage)

1. InsecureAndMessy.addShareholder(address): Potentially should be constant but is not. [more](http://solidity.readthedocs.io/en/develop/contracts.html#constant-functions)

1. InsecureAndMessy[.addShareholder(address), .dispense()]: Variables have very similar names shareholders and shareholder.
