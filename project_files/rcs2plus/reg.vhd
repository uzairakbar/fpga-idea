----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    00:39:26 01/28/2018 
-- Design Name:
-- Module Name:    reg - Behavioral
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

entity reg is
    Port ( Clock : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           Input : in  STD_LOGIC_VECTOR (15 downto 0);
           Output : out  STD_LOGIC_VECTOR (15 downto 0));
end reg;

architecture Behavioral of reg is

begin

	reg_process: process (Clock)
		begin
			if rising_edge(Clock) then
				if ENABLE ='1' then
					Output<=Input;
				end if;
			end if;
		end process;

end Behavioral;
