# Ethereum Todolist App

Contract for a to-do list app, written in solidity and using the Hardhat Ethereum development environment.

_Corresponding frontend code can be found [here](https://github.com/joshuascan/eth-todolist-frontend)_

## Required Environment Variables for Deployment

If deploying this app, you will need to create a .env and include the follow variables:

- ALCHEMY_API_URL= _Sign up at [alchemy](https://www.alchemy.com/) and create a new project on the Rinkeby test net_
- PRIVATE_KEY= _Your wallet private key_

## To Deploy

1. Run "npx hardhat compile"
2. Run "npx hardhat run scripts/deploy.js --network rinkeby"
