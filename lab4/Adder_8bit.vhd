Library  IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Adder_8bit is
	port(
		A : in std_logic_vector  (7 downto 0);
		B: in std_logic_vector (7 downto 0);
		cin: in std_logic;
		Sum : out std_logic_vector (7 downto 0);
		cout: out std_logic );
end Adder_8bit;


architecture RTL of Adder_8bit is 
signal InternalSum: std_logic_vector(8 downto 0);
begin
	InternalSum<=('0'&A) + ('0'&B) +("00000000"&cin);
	Sum<= InternalSum(7 downto 0);
	cout<= InternalSum(8);
end RTL;