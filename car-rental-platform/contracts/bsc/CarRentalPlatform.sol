// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Tip: SMartc ontract development workflow:
// 1. COnstruct layout or logic for he contract ->
// 2. Then work on the implmentation of the logic. Separation of concerns
// to reduce errors.
// 1. Logic outline: contains an outline of data types required, the functions needed

import "../../node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract CarRentalPlatform {
  //1. DATA SECTION

  //Counter

  //Owner

  //totalPayments

  //user struct

  //car struct

  //enum to inidcate the of the car

  // events

  //user ampping

  //car mapping

  //constructor

  //2. MODIFIFIERS SECTION

  //onlyOwner 

  //3. FUNCTIONS SECTION
  //3.1. Execute Functions

  //setOwner #onlyOwner

  //addUser #nonExisting

  //addCar #onlyOwner #nonExistingCar

  //editCarStatus #onlyOwner #exisingCar

  //checkOut #exitingUser #isCarAvailable #userHasNotRentedACar #userHasNoDebt

  //checkIn #exisintgUser #userHasRentedACar

  //edeposit #existingUser

  //makePayment #existingUser #existingDebt #sufficientBalance

  //withdrawalBalance #existingUser

  //withdrawOwnerBalance #onlyOwner

  //3.2. Query Functions

  //getOwner

  //isUser

  //getUser #existingUser

  //getCar #existingCar

  //getCarByStatus

  //calculateDebt

  //getCurrentCount

  //getContractBalance #onlyOwner

  //getTotalPayment #onlyOwner


}
