# Solidity Cheat Sheet

### Data Types

Solidity is statically typed: each variable type needs to be needs to be specified (or coeracible, see Type Dedication below)

- **bool**: boolean, expects outcome to be true/false

- **int** / **uint**: signed and unsigned integers. Unsigned integers are always positive numbers. Keywords `uint8` through `uint256` increment in steps of 8 bits. Same applies to `int` (`int8` through `int256`). `uint` & `int` are aliases for `uint256` & `int256` respectively.

- **fixed** / **ufixed**: *Not fully supported in solidity yet*. Keywords ufixedMxN/fixedMxN where `M` is # of bits taken by type & `N` is # of decimal points. `M` can range from 8 - 256 in increments of 8. `N` is between 0 & 80, inclusive. `ufixed`/`fixed` are aliases for `ufixed128x19` & `fixed128x19`, respectively.

- **address**: 20 byte value (the size of an Eth address). Address types also have members and serve as the base for all contracts.
    - `<address>.balance (uint256)`: balance of address in Wei
    - `<address>.transfer(uint256 amount)`: send given amount of Wei to address, throws on failure
    - `<address>.send(uint256 amount) returns (bool)`: sends given amount of Wei to address, returns `false` on failure.
        * generally use pattern where recipient withdraws money instead of using `send`.
    - there are 3 additional modifiers on `address`: `call`, `delegatecall` and `callcode` are very low-level functions and should only be used as a last resort as they break the type-safety of Solidity. [More details...](http://solidity.readthedocs.io/en/develop/types.html#address)
    - All contracts inherit the members of address, so it is possible to query the balance of the current contract using `this.balance`.
- **fixed-size byte arrays**: `bytes1`, `bytes2`,`bytes3`, ..., `bytes32`. `.length` gives fixed length of byte array (read-only)
- **dynamically sized byte array.**
