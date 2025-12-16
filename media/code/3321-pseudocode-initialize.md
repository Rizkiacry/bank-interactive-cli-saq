ALGORITHM initialize_account
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Initialized account with default values

BEGIN
    acc.accno = 0
    acc.name = ""
    acc.address = ""
    acc.actype = '\0'
    acc.amount = 0.0
END

