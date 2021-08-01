  
const swap = artifacts.require("swap");

var accounts;
var owner;

contract('swap', (accs) => {
          accounts = accs;
          owner = accounts[0];
});

it('can swap token for eth', async() => {
    
    let instance = await swap.deployed();
    let value=await instance.swap1({from: accounts[0]});
   // assert.equal(await instance.tokenIdToStarInfo.call(tokenId), 'Awesome Star!')
});
