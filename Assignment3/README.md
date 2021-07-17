# Block Voting 

## Instructions to test the contract

* Open the [Remix IDE](https://remix.ethereum.org/) and create a new *.*sol* file. For steps ahead, we will refer this file by *vote.sol*. 

* Copy and Paste the code present inside *a3.sol* in *vote.sol* and compile the code. 

* On the left sidebar in Remix IDE, choose the option to Deploy the Smart Contract. 

* Choose the environment as *Javascript VM* , Account as the top account, let's call it account 1 (we'll be continuing with this naming convention) in drop down menu (will be our chairperson) , select number of seats as 2 and then click on *Deploy*.

* Now the voting system is deployed by the chairperson, to select 2 candidates. 

### Applying for candidature

* Now let's make the account 2, 3, and 4 apply for candidature. 

* For that select those accounts one by one from the drop down menu above, after selecting an account click on **RequestCandidature** button. 

* Note this will trigger the RequestVotingRights function too, so the candidate need not apply for voting rights seperately.  
 
 
### Owner requesting the loan

* Select any other account than the top one from the Account drop down menu.

* Click on the reqLoan button after providing the values of principle, interest, time as integers and click on transact.

* This would emit a Request event and add the amount in the loans mapping of the contract owner i.e. account 1.

### Getting the owner's balance

* First select any account from the Account drop down menu.

* Now click on the getOwnerBalance button in the contract.

* It will display the owner's current account balance.

### View dues

* First select account 1 from the menu because only the owner of contract can use this function.

* Click on the viewDues button and provide the address of the requestor's account.

* Click on call and you will get the amount of money you owe to that account.

### Settle dues

* First select account 1 from the menu because only the owner of contract can use this function.

* Click on the viewDues button after providing the address of the requestor's account.

* Click on transact and the loan amount would be transferred to the requestor's account only if there is sufficient balance in the account.


