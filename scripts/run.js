const hre = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  const JellyBean = await ethers.getContractFactory("JellyBean");

  const jellyBean = await JellyBean.deploy(
   "storageapi.fleek.co/4f644b4e-b285-4cc4-8494-e8da6218d53f-bucket/jellyBeansMetadata/",
   ethers.utils.parseEther("0.079"),
    "PROVENANCE_HASH"
  );

  await jellyBean.deployed();
  console.log("JellyBean contract deployed to:", jellyBean.address);
  console.log("Provenance:", await jellyBean.JELLY_PROVENANCE());

  await jellyBean.mint({value: ethers.utils.parseEther("0.08")});
  console.log("TokenURI for #1:", await jellyBean.tokenURI(1));

  console.log("Pre withdraw balance: ", await ethers.utils.formatEther(await ethers.provider.getBalance(deployer.address)))
  await jellyBean.withdraw();
  console.log("Post withdraw balance: ", await ethers.utils.formatEther(await ethers.provider.getBalance(deployer.address)))

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
