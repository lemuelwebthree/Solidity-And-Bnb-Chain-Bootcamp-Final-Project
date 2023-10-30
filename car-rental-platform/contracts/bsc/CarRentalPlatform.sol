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
  Counters.Counter private_counter;

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
  modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can call this function");
    // do not forget to add in merge wildcard in modifier definitions
    _;
  }

  //3. FUNCTIONS SECTION
  //3.1. Execute Functions

  //setOwner #onlyOwner
  function setOwner(address _newOwner) external onlyOwner {
    owner = _newOwner;
  }

  //addUser #nonExisting
  // calldata helps us to perfrom gas-efficient reads
  function addUser(string calldata name,string calldata lastname) external {
    require(!isUser(msg.sender), "User already exists");
    users[msg.sender] = User(msg.sender, name, lastname, 0, 0, 0, 0);

    emit UserAdded(msg.sender, user[msg.sender].name, users[msg.sender].lastname);
  }

  //addCar #onlyOwner #nonExistingCar
  function addCar(string calldata name, string calldata url, uint rent, uint sale) external onlyOwner {
    _counter.increment();
    uint counter = _counter.current();
    cars[counter] = Car(counter, name, url, Status.Available, rent, sale);

    emit CarAdded(counter, cars[counter].name, cars[counter].imgUrl, cars[counter].rentFee, cars[counter].saleFee, cars[counter].saleFee);
  }

  //editCarStatus #onlyOwner #exisingCar
  function editCarMetadata(uint id, string calldata name, string calldata imgUrl, uint rentFee, uint saleFee) external onlyOwner {
      // cannot edit a card that does not exist
      require(cars[id].id !=0, "Car with given ID does not exist");
      Car storage car = cars[id];
      if(bytes(name).length !=0) {
        car.name = name;
      }
      if(bytes(imgUrl).length !=0) {
        car.imgUrl = imgUrl;
      }
      if(rentFee > 0) {
        car.rentFee = rentFee;
      }
      if(saleFee > 0) {
        car.saleFee = saleFee;
      }

      emit CarMetadataEdited(id, car.name, car.imgUrl, car.rentFee, car.saleFee);
  }


  //editCarStatus #onlyOwner #exisingCar
  function editCarStatus(uint id, Status status) external onlyOwner {
    require(cars[id].id !=0, "Car with given id does not exist");
    cars[id].status = status;

    emit CarStatusEdited(id, status);
  }

  //checkOut #exitingUser #isCarAvailable #userHasNotRentedACar #userHasNoDebt
  function checkOut(uint id) external {
    require(isUser(msg.sender), "User does not exist");
    require(cars[id].status == Status.Available, "Car is not Available for use");
    require(users[msg.sender].rentedCarId == 0, "User has already rented a car");
    require(users[msg.sender].debt == 0, "User has an outstanding debt");

    users[msg.sender].start = block.timestamp;
    users[msg.sender].rentedCarId = id;
    cars[id].status = Status.InUse;

    emit CheckOut(msg.sender, id);
  }

  //checkIn #exisintgUser #userHasRentedACar
  function checkIn() external {
    require(isUser(msg.sender), "User does not exist!");
    uint rentedCarId = users[msg.sender].rentedCarId;
    require(rentedCarId != 0, "User has not rented a car");

    uint usedSeconds = block.timestamp - users[msg.sender].start;
    uint rentFee = cars[rentedCarId].rentFee;
    users[msg.sender].debt += calculateDebt(usedSeconds, rentFee);

    users[msg.sender].rentedCrId = 0;
    users[msg.sender].start = 0;
    cars[rentedCarId].status = Status.Available;

    emit CheckIn(msg.sender, rentedCarId);
  }

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
