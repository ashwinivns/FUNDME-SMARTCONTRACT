//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
 library PriceConverter{

     function getPrice()internal view returns(uint256){
        //address 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        (,int256 price,,,)= priceFeed.latestRoundData();
        //ETH in term of USD
        //3000.00000000
        return uint256(price * 1e10);
       

    }
    function getVersion() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
      

    }
    function getConversionRate(uint256 ethAmount)internal view returns(uint256){
        uint256 ethprice = getPrice();
        uint256 ethAmountInUsd = (ethprice * ethAmount)/1e18;
        return ethAmountInUsd;

    }
}
     
 