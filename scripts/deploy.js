const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deployer address: ", deployer.address);

  const Jb = await hre.ethers.getContractFactory("JellyBean");
  const jb = await Jb.deploy(
    "storageapi.fleek.co/4f644b4e-b285-4cc4-8494-e8da6218d53f-bucket/jellyBeansMetadata/",
    ethers.utils.parseEther("0.079"),
    "754797EB79F6BA904C891BBA1613E0E27BCFBBCD6396818333996F816B12F1CD"
  );
  await jb.deployed();

  console.log("JellyBean Contract deployed to: ", jb.address);

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
