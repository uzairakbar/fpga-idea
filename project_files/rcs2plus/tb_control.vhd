--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   23:29:49 01/27/2018
-- Design Name:
-- Module Name:   C:/Users/uzair/Desktop/rcs2/tb_control.vhd
-- Project Name:  idea_rcs2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: control
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

ENTITY tb_control IS
END tb_control;

ARCHITECTURE behavior OF tb_control IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT control
    PORT(
         CLOCK : IN  std_logic;
         INIT : IN  std_logic;
         TRAFO : IN  std_logic;
         EN125 : OUT  std_logic;
         EN346 : OUT  std_logic;
         EN78 : OUT  std_logic;
         RESULT : OUT  std_logic;
         S : OUT  std_logic_vector(1 downto 0);
         S_T : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal CLOCK : std_logic := '0';
   signal INIT : std_logic := '0';
   signal TRAFO : std_logic := '0';

 	--Outputs
   signal EN125 : std_logic;
   signal EN346 : std_logic;
   signal EN78 : std_logic;
   signal RESULT : std_logic;
   signal S : std_logic_vector(1 downto 0);
   signal S_T : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: control PORT MAP (
          CLOCK => CLOCK,
          INIT => INIT,
          TRAFO => TRAFO,
          EN125 => EN125,
          EN346 => EN346,
          EN78 => EN78,
          RESULT => RESULT,
          S => S,
          S_T => S_T
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

      wait for Clock_period*2;
		wait for 7 ns;
		Init<='1';
		Trafo <='0';
		wait for 15 ns;
		Init <='0';
		wait for 100 ns;
		Init <='1';
		Trafo <='1';
		wait for 15 ns;
		Init <='0';
		wait for 100 ns;
		Init <='1';
		Trafo <='0';
		wait for 15 ns;
		Init <='0';


      -- insert stimulus here

      wait;
   end process;

END;