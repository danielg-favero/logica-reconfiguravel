# Código sequencial

É feito através do bloco `process`

```vhdl
process(lista de sensibilidade)
declaracoes
begin
    declaracao 1;
    declaracao 2;
    ...
    declaracao n;
end process;
```

## Lista de sensibilidade

É o conjunto de sinais para os quais o processo "é sensível". Ex:

```vhdl
process(a, b)
begin
    c <= a or b;
    d <= a and b;
end process;
```

## Código sequencial mesclado com código concorrente

```vhdl
architecture arq of ccto is
    signal...;
begin
    declarao 1;
    declarao 2;

    process(lista de sensibilidade)
    begin
        declaracao 3;
        declaracao 4;
    end process;

    declaracao 5;
    declaracao 6;
end arq;
```

## If

```vhdl
if expressao1 then
    declaracoes;
elsif expressao2 then
    declaracoes;
elsif expressao3 then
    declaracoes;
...
else
    declaracoes;
end if;
```

## Case

```
case selecao is
    when escolha1 => declaracoes;
    when escolha2 => declaracoes;
    ...
    when escolha3 => declaracoes;
end case;
```

## Wait

Faz o código sequencial aguardar por um evento. Ex:

```vhdl
wait until clk'EVENT and click = '1';
wait on clk, rst;
wait for 5 ns;
```

## Loop

```vhdl
for i in x'RANGE loop
    x(i) <= a(M - i) and b(i);
end loop;
```

```vhdl
temp := 0;
for i in N - 1 downto 0 loop
    exit when x(i) = '1';
    temp := temp + 1;
end loop;
```

```vhdl
while i < M loop
    ...
end loop;
```