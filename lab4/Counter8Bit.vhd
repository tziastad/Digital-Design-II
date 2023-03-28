library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity Counter8Bit is
port(
	CLK,RST,CLR,EN: in std_logic;
	CountValue: out std_logic_vector (7 downto 0));
end Counter8Bit;

architecture RTL of Counter8Bit is
signal value: std_logic_vector(7 downto 0);
begin
	s: process(CLK,RST,CLR) begin
		if(RST='1')then 
			value<=(value 'range => '1');
		elsif(CLR='1')then 
			value<=(value'range=> '0');
		elsif (CLK'event and CLK='1')then
			if(EN='1')then
				value<=value+00000001;
			end if;
		end if;
	end process s;
	CountValue<=value;
end RTL;