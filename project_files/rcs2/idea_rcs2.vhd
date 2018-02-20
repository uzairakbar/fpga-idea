----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    idea_rcs2 - Structural 
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

entity idea_rcs2 is
    Port ( CLOCK : in  STD_LOGIC;
           START : in  STD_LOGIC;
           KEY : in  STD_LOGIC_VECTOR (127 downto 0);
           X1 : in  STD_LOGIC_VECTOR (15 downto 0);
           X2 : in  STD_LOGIC_VECTOR (15 downto 0);
           X3 : in  STD_LOGIC_VECTOR (15 downto 0);
           X4 : in  STD_LOGIC_VECTOR (15 downto 0);
           Y1 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y2 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y3 : out  STD_LOGIC_VECTOR (15 downto 0);
           Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
           READY : out  STD_LOGIC);
end idea_rcs2;

architecture Structural of idea_rcs2 is

Signal mux_1_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_2_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_3_out : STD_LOGIC_VECTOR (15 downto 0);
Signal mux_4_out : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_Round : STD_LOGIC_VECTOR (3 downto 0);
Signal sig_Si : STD_LOGIC;
Signal sig_Trafo : STD_LOGIC;
Signal sig_Init : STD_LOGIC;
Signal sig_Result : STD_LOGIC;

Signal sig_Z1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z4 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z5 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_Z6 : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_RY1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RY4 : STD_LOGIC_VECTOR (15 downto 0);

Signal sig_RO1 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO2 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO3 : STD_LOGIC_VECTOR (15 downto 0);
Signal sig_RO4 : STD_LOGIC_VECTOR (15 downto 0);

--components
component mux2x1 Port (D0 : in  STD_LOGIC_VECTOR (15 downto 0);
							  D1: in  STD_LOGIC_VECTOR (15 downto 0);
							  S : in  STD_LOGIC;
							  O : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

Component keygen Port( round_counter : in  STD_LOGIC_VECTOR (3 downto 0);
							  Key : in  STD_LOGIC_VECTOR (127 downto 0);
							  Z1 : out  STD_LOGIC_VECTOR (15 downto 0);
							  Z2 : out  STD_LOGIC_VECTOR (15 downto 0);
							  Z3 : out  STD_LOGIC_VECTOR (15 downto 0);
							  Z4 : out  STD_LOGIC_VECTOR (15 downto 0);
							  Z5 : out  STD_LOGIC_VECTOR (15 downto 0);
							  Z6 : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component reg Port (Clock : in  STD_LOGIC;
						  Enable : in  STD_LOGIC;
						  Input : in  STD_LOGIC_VECTOR (15 downto 0);
						  Output : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component roundcounter  Port (  Clock : in  STD_LOGIC;
										  Start : in  STD_LOGIC;
										  Result : in  STD_LOGIC;
										  Ready : out  STD_LOGIC;
										  S_i : out  STD_LOGIC;
										  Init : out  STD_LOGIC;
										  Trafo : out  STD_LOGIC;
										  Round : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component clockedround Port (	  Clock : in  STD_LOGIC;
										  Trafo : in STD_LOGIC;
										  Init : in STD_LOGIC;
										  X1 : in  STD_LOGIC_VECTOR (15 downto 0);
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
										  Y4 : out  STD_LOGIC_VECTOR (15 downto 0);
										  Result : out STD_LOGIC;
										  Y1_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
										  Y2_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
										  Y3_trafo : out  STD_LOGIC_VECTOR (15 downto 0);
										  Y4_trafo : out  STD_LOGIC_VECTOR (15 downto 0));
end component;



begin

m1: mux2x1 PORT MAP (D0=>sig_RO1,D1=>X1,S=>sig_Si,O=>mux_1_out);
m2: mux2x1 PORT MAP (D0=>sig_RO2,D1=>X2,S=>sig_Si,O=>mux_2_out);
m3: mux2x1 PORT MAP (D0=>sig_RO3,D1=>X3,S=>sig_Si,O=>mux_3_out);
m4: mux2x1 PORT MAP (D0=>sig_RO4,D1=>X4,S=>sig_Si,O=>mux_4_out);

Reg1: reg PORT MAP (Clock=>clock,Enable=>sig_Result,Input=>sig_RY1,Output=>sig_RO1);
Reg2: reg PORT MAP (Clock=>clock,Enable=>sig_Result,Input=>sig_RY2,Output=>sig_RO2);
Reg3: reg PORT MAP (Clock=>clock,Enable=>sig_Result,Input=>sig_RY3,Output=>sig_RO3);
Reg4: reg PORT MAP (Clock=>clock,Enable=>sig_Result,Input=>sig_RY4,Output=>sig_RO4);

K1: keygen PORT MAP (round_counter=>sig_Round,Key=>Key,Z1=>sig_Z1,Z2=>sig_Z2,Z3=>sig_Z3,
							Z4=>sig_Z4,Z5=>sig_Z5,Z6=>sig_Z6);
							
CR: clockedround PORT MAP (Clock=>clock,Trafo => sig_trafo, Init => sig_init, X1=>mux_1_out, X2=>mux_2_out, X3=>mux_3_out,X4=>mux_4_out,
									Z1=>sig_Z1, Z2=>sig_Z2, Z3=>sig_Z3, Z4=>sig_Z4, Z5=>sig_Z5, Z6=>sig_Z6,
									Y1=>sig_RY1, Y2=>sig_RY2, Y3=>sig_RY3, Y4=>sig_RY4,Result=>sig_result,
									Y1_trafo=>Y1,Y2_trafo=>Y2,Y3_trafo=>Y3,Y4_trafo=>Y4);
									
RC: roundcounter PORT MAP (Clock =>clock, Start=> start, Result=>sig_result,Ready=>ready,
									S_i=>sig_si, Init => sig_init, Trafo=>sig_trafo, Round=>sig_round);


end Structural;

