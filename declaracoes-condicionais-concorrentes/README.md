# Declarações condicionais concorrentes

## When / Else

Similar ao if / else

### Exemplo 1

```vhdl
sinal <= expressao_valor_1 when condicao_1 else
         expressao_valor_2 when condicao_2 else
         .
         .
         .
         expressao_valor_n;
```

### Exemplo 2

```vhdl
sinal <= a or b or c when d = e else
         .
         .
         .
```

## With / Select

Similar ao Switch / Case

### Exemplo 1

```vhdl
when sinal_select select
    sinal <= exp_val_1 when escolha_1,
            exp_val_2 when escolha_2,
            .
            .
            .
            exp_val_n when others;
```

> When só admite sinais, não expressões.