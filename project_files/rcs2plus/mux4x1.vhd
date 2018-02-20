----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    22:13:17 01/27/2018 
-- Design Name:
-- Module Name:    mux4x1 - Behavioral
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

entity mux4x1 is
    Port ( mux_in_0 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_in_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           mux_sel : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (15 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is

begin

	process(mux_in_0, mux_in_1, mux_in_2, mux_in_3, mux_sel)
	begin

		case mux_sel is

		when "00" => mux_out <= mux_in_0;
		when "01" => mux_out <= mux_in_1;
		when "10" => mux_out <= mux_in_2;
		when "11" => mux_out <= mux_in_3;
		when others => mux_out <= mux_in_0;

		end case;

	end process;


end Behavioral;
