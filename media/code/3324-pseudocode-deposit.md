ALGORITHM deposit
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Updated account balance

BEGIN
    DECLARE d AS FLOAT
    PRINT "Masukkan jumlah untuk disetor = "
    READ d FROM user
    
    IF d > 0 THEN
        acc.amount = acc.amount + d
        PRINT "Setoran berhasil. Saldo Baru = " + acc.amount
    ELSE
        PRINT "Jumlah setoran harus positif"
    END IF
END
