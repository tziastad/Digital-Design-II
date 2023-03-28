library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

ENTITY Adder IS
	generic (n: integer:=4);
	port(
		CRTL: IN STD_LOGIC;
		A,B: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		F: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		COUT: OUT STD_LOGIC);
END Adder;

ARCHITECTURE RTL OF Adder IS
	SIGNAL Interm: std_logic_vector(n downto 0);
BEGIN

p0: process(A,B,CRTL)
begin 
	if (CRTL= '0') then Interm<='0'&B;
	else Interm<=('0' & A)+ ('0' & B);
	end if;
end process;
F<=Interm(n-1 DOWNTO 0);
COUT<=Interm(n);
END RTL;