ALGORITHM find_available_slot
INPUT: accounts AS ARRAY OF BankAccount, size AS INTEGER
OUTPUT: Index of first empty slot, or -1 if full

BEGIN
    FOR i = 0 TO size - 1 DO
        IF is_account_empty(accounts[i]) THEN
            RETURN i
        END IF
    END FOR
    RETURN -1
END
