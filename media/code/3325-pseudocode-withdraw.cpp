
ALGORITHM withdraw
INPUT: acc AS REFERENCE TO BankAccount
OUTPUT: Updated account balance

BEGIN
  DECLARE wd AS FLOAT
  PRINT "Masukkan jumlah untuk ditarik = "
  READ wd FROM user

  IF wd > acc.amount THEN
    PRINT "Saldo tidak mencukupi"
  ELSE IF wd <= 0 THEN
    PRINT "Jumlah penarikan harus positif"
  ELSE
    acc.amount = acc.amount - wd
    PRINT "Penarikan berhasil"
  END IF

  PRINT "Sisa saldo: " + acc.amount
END

