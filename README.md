# Pairing Rails Programming Test

##### Essential Models:
1) Customer :=> to store customer information + payment details
2) Contract :=> To store contract details
3) Invoice  :=> To store invoice details
4) ContractLog :=> To keep history of a contract


##### TODOS:
Due to shortage of time, Needs to be implemented!


##### Assumptions:
Documented where ever needed due to general requirements!


##### Is challange Completed?
Well, I was super busy this week, could not managed proper time to write beautiful code. But basic structure will serve the purpose!


#### Business Logic:
PremiumCalculator takes a contract and do some secret calculations and return new premium.
1. Lets say we have a yearly contract, against which we have also taken advance from the customer, i.e. 100 which means 1 invoice already exists against that contract of amount 100 with coverage value :=> 10
2. Now We need to update coverage to 200. we will call `@contract.update_coverage(200, '27-05-2021'.to_date)` 
3. It will:
  * → calculate new_premium
  * → remaining customer balance :=> for the sake of simplicity, through pro_rata
  * → create new invoice :=> `invoice.amount = new_premium - remaining_customer_balance`
  * → entry in the log about what contract attr is changes and what was our previous premium

#### Integration Testing:
Detailed testing is missing. Very Basic structure prepared!

 
