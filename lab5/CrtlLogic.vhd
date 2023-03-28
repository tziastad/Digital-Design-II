library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity CrtlLogic is
	generic(n: integer:=4);
	port(
			Rst,CLK: in std_logic;
			SL_A,SL_B,SL_H,SL_L,SL_C: out std_logic;
			EN_A,EN_B,EN_H,EN_L,EN_C: out std_logic);

end CrtlLogic;


architecture RTL of CrtlLogic is
	type state_type is(LOAD,MULT,HOLD);
	type mult_type is(SHIFT,ADD);
	signal state: state_type;
	signal m_state: mult_type;
	signal count: std_logic_vector(n-1 downto 0);
	
begin

p0:process(Rst,CLK)
begin
	if(Rst='1')then
		state<=LOAD;
		count<=(n-1 downto 0=> '0');
	elsif (CLK'event and CLK='1')then
		case state is
			when LOAD=> if((conv_integer(count)<2*n-1))then count<=count+1;
						else count<=(n-1 downto 0=>'0');
							 state<=MULT;
							 m_state<=ADD;
							
						end if;
			when MULT=> if(m_state=ADD)then m_state<= SHIFT;
						elsif(m_state=SHIFT)then
							m_state<=ADD;
							if((conv_integer(count)<n-1))then count<=count+1;
							else state<=HOLD;
							end if;
						end if;
			when HOLD=> null;
		end case;
	end if;
end process;
EN_A<='1'when state=LOAD else '0';
SL_A<='1' when state=LOAD else '0';
EN_B<='1' when (state=LOAD or(state=MULT and m_state=SHIFT)) else '0';
SL_B<='1' when (state=LOAD or(state=MULT and m_state=SHIFT)) else '0';
EN_H<= '1' when state=MULT else '0';
SL_H<='1' when m_state=SHIFT else '0';
EN_L<='1' when(state=MULT and m_state=SHIFT)else '0';
SL_L<='1' when(state=MULT and m_state=SHIFT)else '0';
EN_C<='1' when(state=MULT and m_state=ADD)else '0';
SL_C<='0';
end RTL;