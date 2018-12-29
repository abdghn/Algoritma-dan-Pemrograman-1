CHDIR ".\Kelompok1"

'*****************************************************************************
'------------------------------ TUGAS AP 1 A ---------------------------------
'--------------------------- KELOMPOK 1 / 1IA09 ------------------------------
'ANGGOTA :
'   NAMA :                                  NPM :
'   1. ABDUL GHANI                              5C414919
'   2. ACHMAD ARSYIL                            50414098
'   3. ADRIAN FAISAL                            50414350
'   4. AHMAD IQBAL FAUZI                        50414569
'   5. ALFONSIUS KRISNANDA                      50414827
'   6. ANANDA CITRA DEWI                        50414989
'   7. ANDRIANNUS PARASIAN                      51414161
'   8. ARIF                                     51414579
'   9. AZZAM HERANUR                            51414945
'   10. CHAMELY AGUSTIA                         52414321
'*****************************************************************************
'-----------------------------------------------------------------------------
'       PLEASE COPY THIS FILE WITH THE FOLDER INTO YOUR WORKING DIRECTORY

menu

SUB menu
COLOR 14
CLS
LOCATE 5, 1
PRINT TAB(10); "------------------------------------------------------------"
PRINT TAB(10); "|                        Menu Utama                        |"
PRINT TAB(10); "------------------------------------------------------------"
PRINT TAB(10); "|"; TAB(32); "1. INPUT DATA"; TAB(69); "|"
PRINT TAB(10); "|"; TAB(32); "2. TAMPILKAN DATA"; TAB(69); "|"
PRINT TAB(10); "|"; TAB(32); "3. RUNNING TEXT"; TAB(69); "|"
PRINT TAB(10); "|"; TAB(32); "4. KELUAR"; TAB(69); "|"
PRINT TAB(10); "------------------------------------------------------------"
LOCATE 14, 10
PRINT "------------------------------------------------------------"
LOCATE 13, 10
PRINT "|"
LOCATE 13, 69
PRINT "|"
DO
    LOCATE 13, 24
    INPUT "PILIH : ", s
    SELECT CASE s

        CASE 1
            CLS
            INPUTDATA
            
        CASE 2
            CLS
            READDATA

        CASE 3
            running
            
        CASE 4
            LOCATE 16, 11
            INPUT "Anda yakin ingin keluar (y/t) ? ", pil$
            IF pil$ = "T" OR pil$ = "t" THEN
                LOCATE 13, 24
                PRINT "                      "
                LOCATE 16, 11
                PRINT "                                         "
            END IF
        CASE ELSE
            LOCATE 16, 11
            PRINT "Maaf, input tidak valid. Tekan ESC untuk input ulang."
            DO
            LOOP UNTIL INKEY$ = CHR$(27)
            LOCATE 13, 24
            PRINT "                      "
            LOCATE 16, 11
            PRINT "                                                                   "
    END SELECT
LOOP UNTIL pil$ = "Y" OR pil$ = "y"
END
END SUB


SUB INPUTDATA

'Inisiasi File
BUF.OUT = 1: BUF.IN = 2


LOCATE 5, 1
PRINT TAB(10); "------------------------------------------------------------"
PRINT TAB(10); "|                         Input Data                       |"
PRINT TAB(10); "------------------------------------------------------------"
PRINT TAB(10); "|"; TAB(32); "1. EDIT DATA PEMAIN"; TAB(69); "|"
PRINT TAB(10); "|"; TAB(32); "2. TAMBAH PEMAIN"; TAB(69); "|"
PRINT TAB(10); "|"; TAB(32); "3. MENU"; TAB(69); "|"
PRINT TAB(10); "------------------------------------------------------------"
LOCATE 13, 10
PRINT "------------------------------------------------------------"
LOCATE 12, 10
PRINT "|"
LOCATE 12, 69
PRINT "|"
LOCATE 12, 24
INPUT "PILIH : ", PIL

SELECT CASE PIL
    CASE 1
        CLS
        OPEN "BARCA.DAT" FOR INPUT AS BUF.IN
        OPEN "BARCA.$$$" FOR OUTPUT AS BUF.OUT
        
        'HEADER
        LOCATE 5, 1
        PRINT TAB(10); "------------------------------------------------------------"
        PRINT TAB(10); "|                     EDIT DATA PEMAIN                     |"
        PRINT TAB(10); "------------------------------------------------------------"
        
        WHILE NOT EOF(BUF.IN)
            INPUT #BUF.IN, NAM$, NOP$, year
        
            'CLEAR AREA
            LOCATE 9, 10: PRINT "                                                                    "
            LOCATE 10, 10: PRINT "                                                                  "
            
      'DRAW
        LOCATE 10, 10: PRINT "|": LOCATE 10, 69: PRINT "|"
        LOCATE 9, 10: PRINT "|": LOCATE 9, 69: PRINT "|"
        
            LOCATE 8: PRINT TAB(10); "|"; TAB(32); "NAMA : "; NAM$; TAB(69); "|"
            LOCATE 11, 10: PRINT "------------------------------------------------------------"
            LOCATE 9, 32: INPUT "NOMOR PUNGGUNG : ", NOP$
            IF NOP$ <> CHR$(27) THEN
            LOCATE 10, 32: INPUT "TAHUN LAHIR : ", year
            WRITE #BUF.OUT, NAM$, NOP$, year
            END IF
        WEND
        PRINT
        PRINT "Pembaruan Selesai"
        CLOSE BUF.IN, BUF.OUT
        KILL "BARCA.DAT"
        NAME "BARCA.$$$" AS "BARCA.DAT"
        PRINT "Tekan ESC untuk kembali ke menu"
        DO
        LOOP UNTIL INKEY$ = CHR$(27)
        menu

    CASE 2
        CLS
        OPEN "BARCA.DAT" FOR APPEND AS BUF.OUT
        
        'HEADER
        LOCATE 5, 1
        PRINT TAB(10); "------------------------------------------------------------"
        PRINT TAB(10); "|                       TAMBAH PEMAIN                      |"
        PRINT TAB(10); "------------------------------------------------------------"
        
        'FOOTER
        LOCATE 10, 10: PRINT "------------------------------------------------------------"
        LOCATE 11, 10: PRINT "|  Tekan ESC untuk kembali ke menu                         |"
        LOCATE 12, 10: PRINT "------------------------------------------------------------"

        DO
        
            'CLEAR AREA
            LOCATE 8, 10: PRINT "                                                                    "
            LOCATE 9, 10: PRINT "                                                                   "
            
            'DRAW
             LOCATE 9, 10: PRINT "|": LOCATE 9, 69: PRINT "|"
        LOCATE 8, 10: PRINT "|": LOCATE 8, 69: PRINT "|"
        
            LOCATE 8, 32: INPUT "Nama Pemain : ", NAM$
            IF NAM$ <> CHR$(27) THEN
                LOCATE 9, 32: INPUT "Tahun Lahir : ", year
                WRITE #BUF.OUT, NAM$, "0", year
            END IF
        LOOP UNTIL NAM$ = CHR$(27)
        CLOSE BUF.OUT
        menu
    CASE 3
        menu
END SELECT
END SUB


SUB READDATA
BUF.OUT = 1: BUF.IN = 2
PRINT
PRINT TAB(15); "--------------------------------------------"
PRINT TAB(15); "|          DAFTAR PEMAIN BARCELONA         |"
PRINT TAB(15); "--------------------------------------------"
PRINT TAB(15); "|"; TAB(17); "NO"; TAB(21); "|"; TAB(23); "NAMA PEMAIN"; TAB(36); "|"; TAB(38); "NO. PUNGGUNG"; TAB(51); "|"; TAB(53); "USIA"; TAB(58); "|"
PRINT TAB(15); "--------------------------------------------"
OPEN "BARCA.DAT" FOR INPUT AS BUF.IN
WHILE NOT EOF(BUF.IN)
    INPUT #BUF.IN, NAM$, NOP$, year
    age = 2014 - year
    NO = NO + 1
    PRINT TAB(15); "|"; TAB(17); NO; TAB(21); "|"; TAB(23); NAM$; TAB(36); "|"; TAB(38); NOP$; TAB(51); "|"; TAB(53); age; TAB(58); "|"
WEND
PRINT TAB(15); "--------------------------------------------"
PRINT
PRINT "Tekan ESC  untuk kembali ke menu"
DO
LOOP UNTIL INKEY$ = CHR$(27)
CLOSE BUF.IN
menu
END SUB

SUB running
DIM AzzamStr AS STRING
DIM KIRIStr AS STRING
DIM KANANStr AS STRING
DIM CountTxt AS INTEGER
DIM countDly AS LONG

AzzamStr$ = "    SELAMAT DATANG     "
LongStr$ = AzzamStr
LenAzzam = LEN(AzzamStr$)
countKanan = LenAzzam
CountTxt = 0
countDly = 0
CLS
LOCATE 8, 25
PRINT "-----------------------------"
LOCATE 9, 25
PRINT "|"
LOCATE 9, 53
PRINT "|"
LOCATE 10, 25
PRINT "|"
LOCATE 10, 53
PRINT "|"
LOCATE 11, 25
PRINT "|"
LOCATE 11, 53
PRINT "|"
LOCATE 12, 25
PRINT "-----------------------------"
LOCATE 14, 27
PRINT "Tekan  ESC untuk  keluar"
DO
    LOCATE 10, 28
    IF CountTxt <= LenAzzam - 1 THEN
        CountTxt = CountTxt + 1
    ELSE
        CountTxt = 1
    END IF
    IF countKanan >= 1 THEN
        countKanan = countKanan - 1
    ELSE
        countKanan = LenAzzam - 1
    END IF
    KIRIStr = LEFT$(AzzamStr$, CountTxt)
    KANANStr = RIGHT$(AzzamStr$, countKanan)
    HASIL$ = KANANStr + KIRIStr
    COLOR 14
    PRINT HASIL$
    countDly = 0
    DO
        countDly = countDly + 1.0
    LOOP UNTIL countDly = 5000000
LOOP UNTIL INKEY$ = CHR$(27)
menu
END SUB
