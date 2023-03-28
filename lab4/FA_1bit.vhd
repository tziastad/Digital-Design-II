library IEEE;
use IEEE.std_logic_1164.all;

entity FA is

	port
	(-- Input ports
		A	: in  std_logic;
		B	: in  std_logic;
		Cin	: in  std_logic;

		-- Output ports
		S	: out std_logic;
		Cout: out std_logic);
end FA;


architecture behavior of FA  is


begin
	S<= A XOR B XOR Cin;
	Cout<= (A AND B) OR (A AND Cin) OR (B AND Cin);
end behavior;
