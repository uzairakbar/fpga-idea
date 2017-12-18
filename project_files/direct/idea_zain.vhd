----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:26 11/22/2017 
-- Design Name: 
-- Module Name:    idea_zain - Behavioral 
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

entity idea is
    Port ( X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0));
end idea;

architecture Behavioral of idea is

component round is 
Port(      X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
			  
			  Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
			  Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
			  Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
			  
			  Y1 : out STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out STD_LOGIC_VECTOR (15 downto 0);
			  Y3 : out STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out STD_LOGIC_VECTOR (15 downto 0));
	end component round;

component trafo is 
Port(      X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
			  
           Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
           Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
           
			  Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
	end component trafo;

signal S11, S12, S13, S14, S21, S22, S23, S24, S31, S32, S33, S34, S41, S42, S43, S44, S51, S52, S53, S54, S61, S62, S63, S64, S71, S72, S73, S74, S81, S82, S83, S84 : STD_LOGIC_VECTOR (15 downto 0);
signal key_cop : std_logic_vector(127 downto 0);
type my_array is array (51 downto 0) of std_logic_vector(15 downto 0);
signal par_keys : my_array;

begin

keygen: process
variable temp_key : std_logic_vector(127 downto 0);
variable count : integer range 0 to 51;
begin
temp_key := KEY;
count := 0;
for i in 0 to 7 loop
	for j in 0 to 5 loop
		par_keys(count) <= temp_key (127-(16*j) downto 127-(16*(j+1)));
		count := count + 1;
	end loop;
	temp_key := temp_key(102 downto 0) & temp_key(127 downto 103);
end loop;

for j in 0 to 3 loop
		par_keys(count) <= temp_key (127 - 16*(j) downto 127 - 16*(j+1));
		count := count + 1;
end loop;

end process;

	r_1 : round port map (
			  X1 => X_1,
           X2 => X_2,
			  X3 => X_3,
           X4 => X_4,
			  
			  Z1 => par_keys(0),
           Z2 => par_keys(1),
			  Z3 => par_keys(2),
           Z4 => par_keys(3),
			  Z5 => par_keys(4),
			  Z6 => par_keys(5),
			  
			  Y1 => S11,
           Y2 => S12,
			  Y3 => S13,
           Y4 => S14);
			  
	r_2 : round port map (
			  X1 => S11,
           X2 => S12,
			  X3 => S13,
           X4 => S14,
			  
			  Z1 => par_keys(6),
           Z2 => par_keys(7),
			  Z3 => par_keys(8),
           Z4 => par_keys(9),
			  Z5 => par_keys(10),
			  Z6 => par_keys(11),
			  
			  Y1 => S21,
           Y2 => S22,
			  Y3 => S23,
           Y4 => S24);
		
	r_3 : round port map (
			  X1 => S21,
           X2 => S22,
			  X3 => S23,
           X4 => S24,
			  
			  Z1 => par_keys(12),
           Z2 => par_keys(13),
			  Z3 => par_keys(14),
           Z4 => par_keys(15),
			  Z5 => par_keys(16),
			  Z6 => par_keys(17),
			  
			  Y1 => S31,
           Y2 => S32,
			  Y3 => S33,
           Y4 => S34);
			  
		r_4 : round port map (
			  X1 => S31,
           X2 => S32,
			  X3 => S33,
           X4 => S34,
			  
			  Z1 => par_keys(18),
           Z2 => par_keys(19),
			  Z3 => par_keys(20),
           Z4 => par_keys(21),
			  Z5 => par_keys(22),
			  Z6 => par_keys(23),
			  
			  Y1 => S41,
           Y2 => S42,
			  Y3 => S43,
           Y4 => S44);
			
		r_5 : round port map (
			  X1 => S41,
           X2 => S42,
			  X3 => S43,
           X4 => S44,
			  
			  Z1 => par_keys(24),
           Z2 => par_keys(25),
			  Z3 => par_keys(26),
           Z4 => par_keys(27),
			  Z5 => par_keys(28),
			  Z6 => par_keys(29),
			  
			  Y1 => S51,
           Y2 => S52,
			  Y3 => S53,
           Y4 => S54);
			  
			r_6 : round port map (
			  X1 => S51,
           X2 => S52,
			  X3 => S53,
           X4 => S54,
			  
			  Z1 => par_keys(30),
           Z2 => par_keys(31),
			  Z3 => par_keys(32),
           Z4 => par_keys(33),
			  Z5 => par_keys(34),
			  Z6 => par_keys(35),
			  
			  
			  Y1 => S61,
           Y2 => S62,
			  Y3 => S63,
           Y4 => S64);
			  
			r_7 : round port map (
			   X1 => S61,
           X2 => S62,
			  X3 => S63,
           X4 => S64,
			  
			  Z1 => par_keys(36),
           Z2 => par_keys(37),
			  Z3 => par_keys(38),
           Z4 => par_keys(39),
			  Z5 => par_keys(40),
			  Z6 => par_keys(41),
			  
			  Y1 => S71,
           Y2 => S72,
			  Y3 => S73,
           Y4 => S74);
			  
		r_8 : round port map (
			  X1 => S71,
           X2 => S72,
			  X3 => S73,
           X4 => S74,
			  
			  Z1 => par_keys(42),
           Z2 => par_keys(43),
			  Z3 => par_keys(44),
           Z4 => par_keys(45),
			  Z5 => par_keys(46),
			  Z6 => par_keys(47),
			  
			  Y1 => S81,
           Y2 => S82,
			  Y3 => S83,
           Y4 => S84);
			  
		t_o: trafo port map (
			  X1 => S81,
           X2 => S82,
			  X3 => S83,
           X4 => S84,
			  
			  Z1 => par_keys(48),
           Z2 => par_keys(49),
			  Z3 => par_keys(50),
           Z4 => par_keys(51),
			  
			  Y1 => Y_1,
           Y2 => Y_2,
			  Y3 => Y_3,
           Y4 => Y_4);
			  
end Behavioral;

