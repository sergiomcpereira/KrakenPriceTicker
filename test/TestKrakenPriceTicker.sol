pragma solidity ^0.4.16;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/KrakenPriceTicker.sol";

contract TestKrakenPriceTicker is usingOraclize {
     uint public price;
     event Log(string text);
     //Constructor
     function TestKrakenPriceTicker() {
         OAR = OraclizeAddrResolverI(0x5049063e4a7704ac155e4f1f42a4954bbef5bbde);
     }
     function __callback(bytes32 _myid, string _result) {
          require (msg.sender == oraclize_cbAddress());
          Log(_result);
          price = parseInt(_result, 2);
       }
     function testFetchData() {
        //oraclize_query("URL","json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD).USD");
        //Assert.notEqual(price, 0, "price is not zero");
     }
}
