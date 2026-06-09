       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANCOP4.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQ-CONTAS ASSIGN TO UT-S-CONTAS.
       DATA DIVISION.
       FILE SECTION.
       FD ARQ-CONTAS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01 REG-CONTA.
           05 NUM-CONTA    PIC 9(08).
           05 NOME-CLIENTE PIC X(30).
           05 AGENCIA      PIC 9(04).
           05 TIPO-CONTA   PIC X(01).
           05 SALDO        PIC 9(09)V99.
       WORKING-STORAGE SECTION.
       01 WS-TOTAL-CONTAS  PIC 9(05) VALUE ZEROS.
       01 WS-SALDO-TOTAL   PIC S9(11)V99 VALUE ZEROS.
       01 WS-SALDO-EDIT    PIC Z(9).99-.
       01 WS-TOTAL-EDIT    PIC ZZZ99.
       01 WS-FIM           PIC X(01) VALUE 'N'.
       PROCEDURE DIVISION.
       0000-PRINCIPAL.
           PERFORM 1000-INICIAR.
           PERFORM 2000-PROCESSAR UNTIL WS-FIM = 'S'.
           PERFORM 3000-ENCERRAR.
           STOP RUN.
       1000-INICIAR.
           OPEN INPUT ARQ-CONTAS.
           DISPLAY '-----------------------------------'.
           DISPLAY '  BANCO MONTREAL - CONTAS'.
           DISPLAY '-----------------------------------'.
           READ ARQ-CONTAS AT END MOVE 'S' TO WS-FIM.
       2000-PROCESSAR.
           ADD 1 TO WS-TOTAL-CONTAS.
           ADD SALDO TO WS-SALDO-TOTAL.
           MOVE SALDO TO WS-SALDO-EDIT.
           DISPLAY 'CONTA: ' NUM-CONTA.
           DISPLAY 'AGENCIA: ' AGENCIA.
           DISPLAY 'CLIENTE: ' NOME-CLIENTE.
           DISPLAY 'TIPO: ' TIPO-CONTA.
           DISPLAY 'SALDO: ' WS-SALDO-EDIT.
           DISPLAY '-----------------------------------'.
           READ ARQ-CONTAS AT END MOVE 'S' TO WS-FIM.
       3000-ENCERRAR.
           MOVE WS-SALDO-TOTAL TO WS-SALDO-EDIT.
           MOVE WS-TOTAL-CONTAS TO WS-TOTAL-EDIT.
           DISPLAY '==================================='.
           DISPLAY 'TOTAL CONTAS: ' WS-TOTAL-EDIT.
           DISPLAY 'SALDO TOTAL : ' WS-SALDO-EDIT.
           DISPLAY '==================================='.
           CLOSE ARQ-CONTAS.
