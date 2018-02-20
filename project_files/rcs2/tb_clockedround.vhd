--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   00:16:25 01/28/2018
-- Design Name:
-- Module Name:   C:/Users/uzair/Desktop/rcs2/tb_clockedround.vhd
-- Project Name:  idea_rcs2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: clockedround
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_clockedround IS
END tb_clockedround;

ARCHITECTURE behavior OF tb_clockedround IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT clockedround
    PORT(
         CLOCK : IN  std_logic;
         INIT : IN  std_logic;
         TRAFO : IN  std_logic;
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Z1 : IN  std_logic_vector(15 downto 0);
         Z2 : IN  std_logic_vector(15 downto 0);
         Z3 : IN  std_logic_vector(15 downto 0);
         Z4 : IN  std_logic_vector(15 downto 0);
         Z5 : IN  std_logic_vector(15 downto 0);
         Z6 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0);
         RESULT : OUT  std_logic;
         Y1_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y2_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y3_TRAFO : OUT  std_logic_vector(15 downto 0);
         Y4_TRAFO : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLOCK : std_logic := '0';
   signal INIT : std_logic := '0';
   signal TRAFO : std_logic := '0';
   signal X1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z1 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z2 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z3 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z4 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z5 : std_logic_vector(15 downto 0) := (others => '0');
   signal Z6 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);
   signal RESULT : std_logic;
   signal Y1_TRAFO : std_logic_vector(15 downto 0);
   signal Y2_TRAFO : std_logic_vector(15 downto 0);
   signal Y3_TRAFO : std_logic_vector(15 downto 0);
   signal Y4_TRAFO : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: clockedround PORT MAP (
          CLOCK => CLOCK,
          INIT => INIT,
          TRAFO => TRAFO,
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Z1 => Z1,
          Z2 => Z2,
          Z3 => Z3,
          Z4 => Z4,
          Z5 => Z5,
          Z6 => Z6,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4,
          RESULT => RESULT,
          Y1_TRAFO => Y1_TRAFO,
          Y2_TRAFO => Y2_TRAFO,
          Y3_TRAFO => Y3_TRAFO,
          Y4_TRAFO => Y4_TRAFO
        );

-- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for Clock_period*10;

      -- insert stimulus here
		trafo<='0';
		Init<='1';
		X1<=x"1234";
		X2<=x"2345";
		X3<=x"3456";
		X4<=x"4567";
		Z1<=x"1111";
		Z2<=x"2222";
		Z3<=x"3333";
		Z4<=x"4444";
		Z5<=x"5555";
		Z6<=x"6666";
		wait for 15 ns;
		Init<='0';

		wait for 100 ns;
		trafo<='1';
		Init<='1';
		X1<=x"1234";
		X2<=x"2345";
		X3<=x"3456";
		X4<=x"4567";
		Z1<=x"1111";
		Z2<=x"2222";
		Z3<=x"3333";
		Z4<=x"4444";
		Z5<=x"5555";
		Z6<=x"6666";
		wait for 15 ns;
		Init<='0';

      wait;
   end process;

END;
