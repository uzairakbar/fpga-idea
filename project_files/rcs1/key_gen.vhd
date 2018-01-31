----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:38:31 12/19/2017 
-- Design Name: 
-- Module Name:    key_gen - Behavioral 
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

entity key_gen is
    Port ( round : in  STD_LOGIC_VECTOR (3 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           out1 : out  STD_LOGIC_VECTOR (15 downto 0);
           out2 : out  STD_LOGIC_VECTOR (15 downto 0);
           out3 : out  STD_LOGIC_VECTOR (15 downto 0);
           out4 : out  STD_LOGIC_VECTOR (15 downto 0);
           out5 : out  STD_LOGIC_VECTOR (15 downto 0);
           out6 : out  STD_LOGIC_VECTOR (15 downto 0));
end key_gen;

architecture Behavioral of key_gen is

--	TYPE key_barrels_array IS ARRAY(6 downto 0) OF std_logic_vector(127 downto 0);
	SIGNAL key_barrels0 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels1 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels2 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels3 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels4 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels5 : std_logic_vector (127 downto 0);
	SIGNAL key_barrels6 : std_logic_vector (95 downto 0);
	
	signal output : std_logic_vector (95 downto 0);
	
--	signal longlongkey : std_logic_vector(895 downto 0);
	
begin

	process (round, key)
		--variable i : integer range 0 to 8;
	begin
		key_barrels0 <= key;
		key_barrels1 <= key_barrels0(102 downto 0) & key_barrels0(127 downto 103);
		key_barrels2 <= key_barrels1(102 downto 0) & key_barrels1(127 downto 103);
		key_barrels3 <= key_barrels2(102 downto 0) & key_barrels2(127 downto 103);
		key_barrels4 <= key_barrels3(102 downto 0) & key_barrels3(127 downto 103);
		key_barrels5 <= key_barrels4(102 downto 0) & key_barrels4(127 downto 103);
		key_barrels6 <= key_barrels5(102 downto 7); --& key_barrels5(127 downto 103);
	
		case round is
			when "0000" => output <= key_barrels0(127 downto 32);
			when "0001" => output <= key_barrels0(31 downto 0) & key_barrels1(127 downto 64);
			when "0010" => output <= key_barrels1(63 downto 0) & key_barrels2(127 downto 96);
			when "0011" => output <= key_barrels2(95 downto 0);
			when "0100" => output <= key_barrels3(127 downto 32);
			when "0101" => output <= key_barrels3(31 downto 0) & key_barrels4(127 downto 64);
			when "0110" => output <= key_barrels4(63 downto 0) & key_barrels5(127 downto 96);
			when "0111" => output <= key_barrels5(95 downto 0);
			when "1000" => output <= key_barrels6;--(127 downto 32);
			when others => output <= (others => 'X');
		end case;
		
		--output <= longlongkey(895-i*6*16 downto 895-i*6*16-95);
	end process;

	out6 <= output(15 downto 0);
	out5 <= output(31 downto 16);
	out4 <= output(47 downto 32);
	out3 <= output(63 downto 48);
	out2 <= output(79 downto 64);
	out1 <= output(95 downto 80);

end Behavioral;

