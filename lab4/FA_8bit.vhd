library ieee;
use ieee.std_logic_1164.all;

ENTITY FA_8bit is port( 
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector (7 downto 0);
		Cin: in std_logic;
		S: out std_logic_vector(7 downto 0);
		Cout: out std_logic);
end FA_8bit;

architecture RTL of FA_8bit is 
COMPONENT FA port(
		A	: in  std_logic;
		B	: in  std_logic;
		Cin	: in  std_logic;
		S	: out std_logic;
		Cout: out std_logic);
END COMPONENT FA;

	SIGNAL c_int : STD_LOGIC_VECTOR(6 downto 0);
begin
	FA0: FA port map (A(0),B(0),Cin,S(0),c_int(0));
	FA1: FA port map (A(1),B(1),c_int(0),S(1),c_int(1));
	FA2: FA port map (A(2),B(2),c_int(1),S(2),c_int(2));
	FA3: FA port map (A(3),B(3),c_int(2),S(3),c_int(3));
	FA4: FA port map (A(4),B(4),c_int(3),S(4),c_int(4));
	FA5: FA port map (A(5),B(5),c_int(4),S(5),c_int(5));
	FA6: FA port map (A(6),B(6),c_int(5),S(6),c_int(6));
	FA7: FA port map (A(7),B(7),c_int(6),S(7),Cout);
end RTL;