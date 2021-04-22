async function main() {

    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:      ",
        deployer.address
    );

    console.log("Account balance:                           ", (await deployer.getBalance()).toString());

    const Token = await ethers.getContractFactory("FUT");
    const token = await Token.deploy();

    console.log("Token address:                             ", token.address);

    const facetCuts = [
        {
          target: token.address,
          action: 0,
          selectors: Object.keys(token.interface.functions).map(fn => token.interface.getSighash(fn)),
        },
      ];
    
    const FUTDiamond = await ethers.getContractFactory('FUTDiamond');
    const futDiamond = await FUTDiamond.deploy();
    await futDiamond.deployed();
    await FUTDiamond.connect(deployer).diamondCut(facetCuts, ethers.constants.AddressZero, '0x');

}
  
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });