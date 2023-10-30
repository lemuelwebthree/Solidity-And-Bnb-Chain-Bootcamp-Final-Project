// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Tip: SMartc ontract development workflow:
// 1. COnstruct layout or logic for he contract ->
// 2. Then work on the implmentation of the logic. Separation of concerns
// to reduce errors.
// 1. Logic outline: contains an outline of data types required, the functions needed

import "@openzeppelin/contracts/utils/Counters.sol";

contract CarRentalPlatform {
  //1. DATA SECTION

  //Counter
  using Counters for Counters.Counter;
  Counters.COunter private_counter;

  //Owner
  address private owner;

  //totalPayments
  uint private totalPayments;

  //user struct
  struct User {
    address walletAddress;
    string name;
    string lastname;
    uint rentedCarId;
    uint balance;
    uint debt;
    uint start;
  }

  //car struct
  struct Car {
    uint id;
    string name;
    string imgUrl;
    Status status;
    uint rentFee;
    uint saleFee;
  }

  //enum to inidcate the of the car
  enum Status {
    Retired,
    InUse,
    Available
  }
  // events
  event CarAdded(uint indexed id, string name, string imgUrl, uint rentFee, uint saleFee);
  event CarMetadataEdited(uint indexed id, string name, string imgUrl, uint rentFee, uint saleFee);
  event CarStatusEdited(uint indexed id, string name, Status status);
  event UserAdded(uint indexed walletAddresss, string name, string lastname);
  event Deposit(uint indexed walletAddress, uint amount);
  event CheckOut(address indexed walletAddress, uint indexed carId);
  event CheckIn(uint indexed walletAddress, uint indexed carId);
  event PaymentMade(address indexed walletAddress, uint amount);
  event BalanceWithdrawn(address indexed walletAddress, uint amount);


  //user mapping
  mapping(address => User) private users;

  //car mapping
  mapping(uint => Car) private cars;

  //constructor
  constructor() {
    owner = msg.sender;
    //initialise total payments to zero
    totalPayments = 0;
  }
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
