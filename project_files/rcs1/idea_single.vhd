----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_single - Structural 
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

entity idea_single is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X_1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X_4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y_1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y_4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_single;

architecture Structural of idea_single is

	component round is
			Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
					 X2 : in  STD_LOGIC_VECTOR (15 downto 0);
					 X3 : in  STD_LOGIC_VECTOR (15 downto 0);
					 X4 : in  STD_LOGIC_VECTOR (15 downto 0);
					 
					 Z1 : in  STD_LOGIC_VECTOR (15 downto 0);
					 Z2 : in  STD_LOGIC_VECTOR (15 downto 0);
					 Z3 : in  STD_LOGIC_VECTOR (15 downto 0);
					 Z4 : in  STD_LOGIC_VECTOR (15 downto 0);
					 Z5 : in  STD_LOGIC_VECTOR (15 downto 0);
					 Z6 : in  STD_LOGIC_VECTOR (15 downto 0);
					 
					 Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Y4 : out  STD_LOGIC_VECTOR (15 downto 0));
	end component round;
		
	component trafo is
			Port ( X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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

	component keygen is
			Port ( round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
					 Key : in  STD_LOGIC_VECTOR (127 downto 0);
					 Z1 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Z2 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Z3 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Z4 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Z5 : out  STD_LOGIC_VECTOR (15 downto 0);
					 Z6 : out  STD_LOGIC_VECTOR (15 downto 0));
	end component keygen;

	component mux2x1 is
			Port ( D0 : in  STD_LOGIC_VECTOR (15 downto 0);
					 D1 : in  STD_LOGIC_VECTOR (15 downto 0);
					 S : in  STD_LOGIC;
					 O : out  STD_LOGIC_VECTOR (15 downto 0) );
	end component mux2x1;


	component reg16bit is
			Port ( Clock : in  STD_LOGIC;
					 Enable : in  STD_LOGIC;
					 D : in  STD_LOGIC_VECTOR (15 downto 0);
					 Q : out  STD_LOGIC_VECTOR (15 downto 0));
	end component reg16bit;
	
	component control is
			Port ( CLK : in  STD_LOGIC;
					 START : in  STD_LOGIC;
					 ROUND : out  STD_LOGIC_VECTOR (3 downto 0);
					 READY : out  STD_LOGIC;
					 EN : out  STD_LOGIC;
					 S : out  STD_LOGIC);
	end component control;
	
	signal rndout1,rndout2,rndout3,rndout4 : STD_LOGIC_VECTOR (15 downto 0);
	signal regout1,regout2,regout3,regout4 : STD_LOGIC_VECTOR (15 downto 0);
	signal muxout1,muxout2,muxout3,muxout4 : STD_LOGIC_VECTOR (15 downto 0);
	signal partial_key1,partial_key2,partial_key3,partial_key4,partial_key5,partial_key6 : STD_LOGIC_VECTOR (15 downto 0);
	signal round_counter : STD_LOGIC_VECTOR (3 downto 0);
	signal mux_select : STD_LOGIC;
	signal reg_enable : STD_LOGIC;
	
begin

 c1 : control port map (CLK=>CLOCK, START=>START, ROUND=>round_counter, READY=>READY, EN=>reg_enable, S=>mux_select);
 k1 : keygen port map (round_counter=>round_counter,
								Key => KEY,
								Z1 => partial_key1,
								Z2 => partial_key2 ,
								Z3 => partial_key3 ,
								Z4 => partial_key4 ,
								Z5 => partial_key5 ,
								Z6 => partial_key6 );
 mux1 : mux2x1 port map (D0=>X_1,D1=>regout1,S=>mux_select,O=>muxout1);
 mux2 : mux2x1 port map (D0=>X_2,D1=>regout2,S=>mux_select,O=>muxout2);
 mux3 : mux2x1 port map (D0=>X_3,D1=>regout3,S=>mux_select,O=>muxout3);
 mux4 : mux2x1 port map (D0=>X_4,D1=>regout4,S=>mux_select,O=>muxout4);
 
 r1 : round port map(X1=>muxout1,X2=>muxout2,X3=>muxout3,X4=>muxout4,
							Z1=>partial_key1,Z2=>partial_key2,Z3=>partial_key3,Z4=>partial_key4,Z5=>partial_key5,Z6=>partial_key6,
							Y1=>rndout1,Y2=>rndout2,Y3=>rndout3,Y4=>rndout4);
							
 reg1 : reg16bit port map (Clock=>CLOCK, Enable=>reg_enable, D=>rndout1, Q=>regout1);
 reg2 : reg16bit port map (Clock=>CLOCK, Enable=>reg_enable, D=>rndout2, Q=>regout2);
 reg3 : reg16bit port map (Clock=>CLOCK, Enable=>reg_enable, D=>rndout3, Q=>regout3);
 reg4 : reg16bit port map (Clock=>CLOCK, Enable=>reg_enable, D=>rndout4, Q=>regout4);
 
 t1 : trafo port map(X1=>regout1,X2=>regout2,X3=>regout3,X4=>regout4,
				 Z1=>partial_key1,Z2=>partial_key2,Z3=>partial_key3,Z4=>partial_key4,
				 Y1=>Y_1,Y2=>Y_2,Y3=>Y_3,Y4=>Y_4);

end Structural;

