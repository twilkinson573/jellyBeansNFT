const hre = require("hardhat");

async function main() {
  const JellyBean = await hre.ethers.getContractFactory("JellyBean");

  const jellyBean = await JellyBean.deploy(
   "storageapi.fleek.co/4f644b4e-b285-4cc4-8494-e8da6218d53f-bucket/jellyBeansMetadata/",
    "PROVENANCE_HASH"
  );
  await jellyBean.deployed();
  console.log("JellyBean contract deployed to:", jellyBean.address);
  console.log("Provenance:", await jellyBean.JELLY_PROVENANCE());

  await jellyBean.mint();
  console.log("TokenURI for #1:", await jellyBean.tokenURI(1));

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
