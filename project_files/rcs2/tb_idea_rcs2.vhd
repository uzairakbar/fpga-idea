--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   01:24:53 01/28/2018
-- Design Name:
-- Module Name:   C:/Users/uzair/Desktop/rcs2/tb_idea_rcs2.vhd
-- Project Name:  idea_rcs2
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: idea_rcs2
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

ENTITY tb_idea_rcs2 IS
END tb_idea_rcs2;

ARCHITECTURE behavior OF tb_idea_rcs2 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT idea_rcs2
    PORT(
         CLOCK : IN  std_logic;
         START : IN  std_logic;
         KEY : IN  std_logic_vector(127 downto 0);
         X1 : IN  std_logic_vector(15 downto 0);
         X2 : IN  std_logic_vector(15 downto 0);
         X3 : IN  std_logic_vector(15 downto 0);
         X4 : IN  std_logic_vector(15 downto 0);
         Y1 : OUT  std_logic_vector(15 downto 0);
         Y2 : OUT  std_logic_vector(15 downto 0);
         Y3 : OUT  std_logic_vector(15 downto 0);
         Y4 : OUT  std_logic_vector(15 downto 0);
         READY : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal CLOCK : std_logic := '0';
   signal START : std_logic := '0';
   signal KEY : std_logic_vector(127 downto 0) := (others => '0');
   signal X1 : std_logic_vector(15 downto 0) := (others => '0');
   signal X2 : std_logic_vector(15 downto 0) := (others => '0');
   signal X3 : std_logic_vector(15 downto 0) := (others => '0');
   signal X4 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Y1 : std_logic_vector(15 downto 0);
   signal Y2 : std_logic_vector(15 downto 0);
   signal Y3 : std_logic_vector(15 downto 0);
   signal Y4 : std_logic_vector(15 downto 0);
   signal READY : std_logic;

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: idea_rcs2 PORT MAP (
          CLOCK => CLOCK,
          START => START,
          KEY => KEY,
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          Y1 => Y1,
          Y2 => Y2,
          Y3 => Y3,
          Y4 => Y4,
          READY => READY
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

		Key <= x"0001_0002_0003_0004_0005_0006_0007_0008";
		X1<=x"0000";
		X2<=x"0000";
		X3<=x"0000";
		X4<=x"0000";
		wait for 10 ns;
		start<='1';
		wait for 50 ns;
		start<='0';

      wait;
   end process;

END;
