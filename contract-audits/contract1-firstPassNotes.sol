pragma solidity ^0.4.9;              // declares that the compiler should use solidity version 0.4.9 or higher. Breaking changes will be at 0.5.x.

// Create a description of any bugs you find in this contract
// including:
      // what the function should do,
      // what it actually does,
      // what are the consequences of the bug (how to abuse it), and
      // how to fix it.
// RTFM: https://solidity.readthedocs.io/en/develop/

// THIS CONTRACT CONTAINS BUGS - DO NOT USE
contract  InsecureAndMessy {
   /// Mapping of ether shares of the contract.
   mapping(address => uint) shares; // initializes variable shares with a map where keytypes are addresses and valuetypes are 256 byte unsigned integers.
                                    // mapping: creates a hash table with all possible values. a value type is initiated to the bytecode for 0 by default
   address owner;                   // initializes variable owner as type address (20 byte value - the size of an Eth address)
   address[] shareholders;          // initializes variable shareholders as a dynamically sized array that holds 20 byte addresses.
   event FailedSend(address, uint); // defines event FiledSend that takes an 20 byte address & an 256 byte unsigned integer

   function InseceureAndMessy() {  // ERROR: Spelling mistake on the constructor function, should be `function InsecureAndMessy() {`
                                   // the constructor is a function that has the same name as the contract and is only called once when the contract is
                                   // initialized. Mistakes like this can lead to hackers being able to call the contstructor function more than once.
      owner = msg.sender;          // assigns the owner variable the value of the message sender's address on the current call
                                   // msg is a gobally available variable and you can use
                                       // - `msg.data` (returns bytes): complete calldata
                                       // - `msg.gas` (returns uint): remaining gas
                                       // - `msg.sender` (returns address): sender of message on current call
                                       // - `msg.sig` (returns bytes4): first 4 bytes of call data (ie function identifier)
                                       // - `msg.value` (returns uint): amount of wei sent with message
   }

   function () payable {                      // default or fallback function: if a transaction is sent w/out transaction data or if it doesn't call a
                                              // call a valid function on the contract then the default is called again.
      shares[msg.sender] = msg.value;         // ERROR: should be +=, otherwise you're replacing the value, not adding to it
                                              // Accesses the shares map at the address of the sender and assigns the 256 byte unsigned integer to the
                                              // amount of wei sent with the message
                                              // ... error? I think there should be more check here around overflow and that the user is the right person.
   }

   function addShareholder(address shareholder) {    // declares function addShareholder that accepts the arguent shareholder (a 20 byte address)
      require(tx.origin == owner);                   // ERROR: use msg.sender, don't us tx.origin. in a contract chain A > B > C > D, msg.sender = D, tx.origin = A
                                                     // Vitalik has said that tx.orgin may not be 'usable or meangfil' by the serenity release (source: https://ethereum.stackexchange.com/questions/196/how-do-i-make-my-dapp-serenity-proof)
      shareholders.push(shareholder);                // pushes function argument shareholder to array shareholders... Not sure why this is meaningful, wouldn't you want to add it to the map...?
                                                     // I think this function is really underdeveloped, need to RESEARCH.
   }

   /// Withdraw your share.
   function withdraw() {                              // declares function withdraw that takes no arguments
     if (msg.sender.send(shares[msg.sender])) {       // if the send of the shares of the message sender is successful (true)
         shares[msg.sender] = 0;                      // then the shares of the message sender are set to 0
      } else {                                        // else
         FailedSend(msg.sender, shares[msg.sender]);  // emit event FailedSend with the address of the message sender and the value of the sender's shares
      }
   }

   function dispense() {                                 // declares function dispense that takes no arguments
      require(msg.sender == owner);                      // state reverting exception if the address of msg.sender is not the same as ownder
                                                         // require ensures valid conditions.
      address shareholder;                               // declare variable sharholder as type address (20 byte)

      for (var i = 0; i < shareholders.length; i++) {    // ERROR: javascript should be `(uint i = 0; i < shareholders.length - 1; i++)`
                                                         // loops over the length of the shareholders array
         shareholder = shareholders[i];                  // assigns the value of shareholder to the address at index i of shareholders
         uint sh = shares[shareholder];                  // declares variable sh as type unsigned integer 256 and assigns the value of number of shares of that address from the map.
         shares[shareholder] = 0;                        // resets the shares for this shareholder to the default value of 0
         shareholder.send(sh);                           // sends current shares to the shareholder
                                                         // I know you need to be careful with loops, so this might not be the best way.
                                                         // I also have a feeling more check will be needed through here...
      }
   }
}
