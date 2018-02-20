----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    roundcounter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity roundcounter is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           RESULT : in  STD_LOGIC;
           READY : out  STD_LOGIC;
           S_i : out  STD_LOGIC;
           INIT : out  STD_LOGIC;
           TRAFO : out  STD_LOGIC;
           ROUND : out  STD_LOGIC_VECTOR (3 downto 0));
end roundcounter;

architecture Behavioral of roundcounter is

type state_type is (Sleep, Calc, Setup);
signal state: state_type;

signal round_counter: std_logic_vector(3 downto 0);

begin
	state_proc: process (Clock)
	begin
		if rising_edge(Clock) then
			case state is
				when Sleep =>
					Init <= '0';
					Ready <= '1';
					if start ='1' then
						state<=Setup;
					else
						round_counter <= "1000";
					end if;
					
				when Setup =>
					Init <= '1';
					Ready <= '0';
					state <= Calc;
					
				when Calc =>
					Init <='0';
					if Result ='1' then
						if round_counter ="1000" then
							state <= Sleep;
						else
							state <= Setup;
						end if;
					end if;
					
				when others =>
					state <= Sleep;

			end case;
			
			case round_counter is
				when "0000" =>
					if result ='1' then
						round_counter<="0001";
					end if;
					S_i <='1';
					
				when "0001" =>
					if result ='1' then
						round_counter<="0010";
					end if;
					S_i <='0';
					
				when "0010" =>
					if result ='1' then
						round_counter<="0011";
					end if;
					S_i <='0';
					
				when "0011" =>
					if result ='1' then
						round_counter<="0100";
					end if;
					S_i <='0';
					
				when "0100" =>
					if result ='1' then
						round_counter<="0101";
					end if;
					S_i <='0';
					
				when "0101" =>
					if result ='1' then
						round_counter<="0110";
					end if;
					S_i <='0';
					
				when "0110" =>
					if result ='1' then
						round_counter<="0111";
					end if;
					S_i <='0';
					
				when "0111" =>
					if result ='1' then
						round_counter<="1000";
					end if;
					S_i <='0';
					
				when "1000" =>
					if Start ='1' then
						round_counter<="0000";
					end if;
					S_i <='0';
					
				when others =>
					round_counter <="1000";
					
			end case;
			
			round <= round_counter;
			trafo <= round_counter(3);
		
		end if;
	
	end process;


end Behavioral;

