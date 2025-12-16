ALGORITHM find_account_idx
INPUT: acc_num AS INTEGER, accounts AS ARRAY OF BankAccount, size AS INTEGER
OUTPUT: Index of account with acc_num, or -1 if not found

BEGIN
    FOR i = 0 TO size - 1 DO
        IF accounts[i].accno == acc_num THEN
            RETURN i
        END IF
    END FOR
    RETURN -1
END
