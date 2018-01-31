----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:10:41 12/21/2017 
-- Design Name: 
-- Module Name:    reg16bit - Behavioral 
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

entity reg16bit is
    Port ( Clock : in  STD_LOGIC;
           Enable : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (15 downto 0);
           Q : out  STD_LOGIC_VECTOR (15 downto 0));
end reg16bit;

architecture Behavioral of reg16bit is

begin
	
	process (Clock, Enable, D)
	begin
		if (Clock = '1' and Clock'EVENT )then
			if (Enable = '1') then
			Q <= D;
			end if;
		end if;
	end process;

end Behavioral;

