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

# Functions

São pedaços de códigos sequenciais que retorna um objeto de vários tipos.

Exemplo 1:
```vhdl
entity func_max is
    port(
        a, b, c: in integer range 0 to 4;
        y: out integer range 0 to 4    
    );
end entity;

architecture arq of func_max is
    function max(in1, in2, in3: integer) return integer is
    begin
        if(in1 >= in2 and in1 >= in3) then
            return in1;
        elsif (in2 >= in1 and in2 >= in3) then
            return in2;
        else 
            return in3;
        end if;
    end function;
begin
    y <= max(a, b, c)
end architecture;
```

# Procedures

São pedaços de códigos sequenciais que retorna um objeto de algum tipo.

```vhdl
package meu_pacote is
    procedure min_max(signal a, b, c: in integer range 0 to 4;
                      signal min, max: out integer range 0 to 4);
end package;

package body meu_pacote is
    procedure min_max(signal a, b, c: in integer range 0 to 4;
                      signal min, max: out integer range 0 to 4) is
    begin
        if (a >= b) then
            if(a >= c) then max <= a;
                if (b >= c) then min <= c;
                    else min <= b;
                end if
                else
                    max <= c;
                    min <= b;
            end if;
        else 
            if(b >= c) then max <= b;
                if (a >= c) then min <= c;
                    else min <= a;
                end if;
                else
                    max <= c;
                    min <= a;
            end if;
        end if;
    end procedure;
end package body;
```

# Osciladores

Os kits de desenvolvimento (DE10-Lite) possuem 4 osciladores, dois de 50MHz e outros dois de uso mais específico. Os clocks de 50 MHz se conectam nas entradas *PIN_P11* e *PIN_N14*.