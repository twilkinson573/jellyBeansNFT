const hre = require("hardhat");

async function main() {
  const JellyBean = await hre.ethers.getContractFactory("JellyBean");
  const jellyBean = await JellyBean.deploy("steve");

  await jellyBean.deployed();

  await jellyBean.mint();
  
  console.log("Provenance:", await jellyBean.JELLY_PROVENANCE());

  console.log("JellyBean contract deployed to:", jellyBean.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
