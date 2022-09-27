// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; //set a version, ^for any version of the no or above,>=0.8.7 <0.9.0; also possible

contract SimpleStorage {
    //types - boolean, uint, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint256 favoriteNumber = 123; //uint and int can allocate bits uint8 upto uint256 available, default uint256
    // string favoriteNumberInText = "Five";
    // int256 favoriteInt = -5;
    // address myAddress = 0xAa05cb8e8cF8c69a8CD1F7731acab4AC78381059;
    // bytes32 favoriteBytes = "cat"; //32 bytes allocated, strings secretly bytes object, 2 - 32
    
    uint256 favoriteNumber; //public automatically creates getter methods
    People public person = People({favoriteNumber:2,name:"Chad"});
    //uint256[] public favoriteNumbersList
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    function store(uint256 _favoriteNumber) public{
        favoriteNumber=_favoriteNumber;
    }

    //view, pure functions does spend gas to run, dosent change only reads state, unless call is inside a fucntion which costs gas
    function retrive() public view returns(uint256){
        return favoriteNumber;
    }

    // function add() public pure returns(uint256){
    //     return (1+1);
    // }

    //calldata - unmodifiable temperory var, memory - modi temp var , storage - modi perm var
    //data location can only be specifies for array, struct or mapping types. string is an array 
    function addPerson(string memory _name,uint256 _favoriteNumber ) public{
        people.push(People(_favoriteNumber,_name));
        nameToFavoriteNumber[_name]=_favoriteNumber;
    }

}