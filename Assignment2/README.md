# MetaCoin Loan Contract

## Instructions to test the contract

* Open the [Remix IDE](https://remix.ethereum.org/) and create a new *.*sol* file. For steps ahead, we will refer this file by *loan.sol*. 

* Copy and Paste the code present inside *a2.sol* in *loan.sol* and compile the code. 

* On the left sidebar in Remix IDE, choose the option to Deploy the Smart Contract. 

* Choose the environment as *Javascript VM* , Account as the top account in drop down menu (will be our owner) ,contract as Loan-loan.sol and then click on *Deploy*.

### Getting the compound interest

* In the deployed contract enter the values of principle, interest, time as integers in the getCompoundInterest function
 and click to get the compound interest.
 
### Owner requesting the loan

* Select any other account than the top one from the Account drop down menu.

* Click on the reqLoan button after providing the values of principle, interest, time as integers and click on transact.

* This would Emit a Request event and add the amount in the loans mapping of the contract owner i.e. account 1.

### Getting owner's balance

* First select any account from the Account drop down menu.

* Now click on the getOwnerBalance button in the contract.

* It will display the owner's current account balance.

### Viewing dues

* First select account 1 from the menu because only the owner of contract can use this function.

* Click on the viewDues button and provide the address of the requestor's account.

* Click on call and you will get the amount of money you owe to that account.

### Settling dues

* First select account 1 from the menu because only the owner of contract can use this function.

* Click on the viewDues button after providing the address of the requestor's account.

* Click on transact and the loan amount would be transferred to the requestor's account only if there is sufficient balance in the account.


