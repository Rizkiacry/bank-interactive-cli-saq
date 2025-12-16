
ALGORITHM MainProgram
INPUT: User menu selection
OUTPUT: Menu-driven interface for bank account management

BEGIN
    DECLARE accounts AS ARRAY[5] OF BankAccount
    DECLARE choice AS INTEGER
    DECLARE acc_num AS INTEGER
    DECLARE acc_idx AS INTEGER
    
    FOR i = 0 TO 4 DO
        CALL initialize_account(accounts[i])
    END FOR
    
    WHILE true DO
        CALL system("clear")
        CALL display_menu()
        READ choice FROM user
        
        SWITCH choice
            CASE 1:
                acc_idx = CALL find_available_slot(accounts, 5)
                IF acc_idx != -1 THEN
                    CALL create_new_account(accounts[acc_idx])
                    PRINT "Akun Berhasil Dibuat..."
                ELSE
                    PRINT "Batas akun terlampaui"
                END IF
                
            CASE 2:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL deposit(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 3:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL withdraw(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 4:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL display_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 5:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL modify_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 6:
                PRINT "Masukkan no. akun: "
                READ acc_num FROM user
                acc_idx = CALL find_account_idx(acc_num, accounts, 5)
                IF acc_idx != -1 THEN
                    CALL delete_account(accounts[acc_idx])
                ELSE
                    PRINT "Akun tidak ditemukan"
                END IF
                
            CASE 7:
                DECLARE found AS BOOLEAN = FALSE
                FOR i = 0 TO 4 DO
                    IF NOT is_account_empty(accounts[i]) THEN
                        CALL display_account(accounts[i])
                        found = TRUE
                    END IF
                END FOR
                IF NOT found THEN
                    PRINT "Tidak ada akun yang ditemukan"
                END IF
                
            CASE 8:
                CALL exit(0)
                
            DEFAULT:
                PRINT "Pilihan tidak valid"
        END SWITCH
        
        PRINT "Tekan Enter untuk melanjutkan..."
        WAIT FOR user input
    END WHILE
END
