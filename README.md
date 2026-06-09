
# Projeto 4 - Processamento de Contas Bancárias COBOL

Projeto desenvolvido no TK5 (MVS 3.8) utilizando JCL e COBOL ANS 74.

## Estrutura

| Arquivo | Descrição |
|---|---|
| `BANCOP4.cbl` | Programa COBOL principal |
| `BANCOP4.jcl` | JCL com 3 steps |
| `CONTAREG.cpy` | Copybook do layout de contas |
| `CONTAS.TXT` | Arquivo de dados |

## O que o job faz

- **STEP1** — Ordena `CONTAS.TXT` por agência usando o utilitário SORT
- **STEP2** — Compila e linka o programa COBOL
- **STEP3** — Executa o programa e exibe os resultados via DISPLAY

## Saída do programa

```
-----------------------------------
 CONTAS
-----------------------------------
CONTA: 0000400A
AGENCIA: 0001
CLIENTE: ANA OLIVEIRA
TIPO: C
SALDO:       899.90
-----------------------------------
...
===================================
TOTAL CONTAS:    06
SALDO TOTAL :     29601.40
===================================
```

## Execução

Job submetido via TSO no TK5 com sucesso — `MAX COND CODE 0004`.
