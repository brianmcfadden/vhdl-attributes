--
-- testbench to display sample attributes
--
--T'BASE       is the base type of the type T
--T'LEFT       is the leftmost value of type T. (Largest if downto)
--T'RIGHT      is the rightmost value of type T. (Smallest if downto)
--T'HIGH       is the highest value of type T.
--T'LOW        is the lowest value of type T.
--T'ASCENDING  is boolean true if range of T defined with to .
--T'IMAGE(X)   is a string representation of X that is of type T.
--T'VALUE(X)   is a value of type T converted from the string X.
--T'POS(X)     is the integer position of X in the discrete type T.
--T'VAL(X)     is the value of discrete type T at integer position X.
--T'SUCC(X)    is the value of discrete type T that is the successor of X.
--T'PRED(X)    is the value of discrete type T that is the predecessor of X.
--T'LEFTOF(X)  is the value of discrete type T that is left of X.
--T'RIGHTOF(X) is the value of discrete type T that is right of X.
--A'LEFT       is the leftmost subscript of array A or constrained array type.
--A'LEFT(N)    is the leftmost subscript of dimension N of array A.
--A'RIGHT      is the rightmost subscript of array A or constrained array type.
--A'RIGHT(N)   is the rightmost subscript of dimension N of array A.
--A'HIGH       is the highest subscript of array A or constrained array type.
--A'HIGH(N)    is the highest subscript of dimension N of array A.
--A'LOW        is the lowest subscript of array A or constrained array type.
--A'LOW(N)     is the lowest subscript of dimension N of array A.
--A'RANGE      is the range  A'LEFT to A'RIGHT  or  A'LEFT downto A'RIGHT .
--A'RANGE(N)   is the range of dimension N of A.
--A'REVERSE_RANGE  is the range of A with to and downto reversed.
--A'REVERSE_RANGE(N)  is the REVERSE_RANGE of dimension N of array A.
--A'LENGTH     is the integer value of the number of elements in array A.
--A'LENGTH(N)  is the number of elements of dimension N of array A.
--A'ASCENDING  is boolean true if range of A defined with to .
--A'ASCENDING(N)  is boolean true if dimension N of array A defined with to .
--S'DELAYED(t) is the signal value of S at time now - t .
--S'STABLE     is true if no event is occurring on signal S.
--S'STABLE(t)  is true if no even has occurred on signal S for t units of time.
--S'QUIET      is true if signal S is quiet. (no event this simulation cycle)
--S'QUIET(t)   is true if signal S has been quiet for t units of time.
--S'TRANSACTION  is a bit signal, the inverse of previous value each cycle S is active.
--S'EVENT      is true if signal S has had an event this simulation cycle.
--S'ACTIVE     is true if signal S is active during current simulation cycle.
--S'LAST_EVENT is the time since the last event on signal S.
--S'LAST_ACTIVE  is the time since signal S was last active.
--S'LAST_VALUE is the previous value of signal S.
--S'DRIVING    is false only if the current driver of S is a null transaction.
--S'DRIVING_VALUE  is the current driving value of signal S.
--E'SIMPLE_NAME  is a string containing the name of entity E.
--E'INSTANCE_NAME  is a string containing the design hierarchy including E.
--E'PATH_NAME  is a string containing the design hierarchy of E to design root.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity attrs_tb is end entity;

architecture attrs_tb_arch of attrs_tb is
  constant ti: time := 100 ps;
  type T is range 6 to 66;
  subtype SUBT is integer range 2 to 22;
  signal S: std_logic_vector(32 downto 0);
  type A is array(79 downto 54) of std_logic;
  signal ST: T := 19;
  signal SI: integer := 666;
  signal SSL: std_logic := '1';
begin
  stim_proc: process
  begin

    S <= ( 0 => '1', others => '0' );
    wait for 1 ns;
    S <= ( 0 => '0', others => '1' );
    wait for 1 ns;

--  report "SUBT'BASE = " & to_string(SUBT'BASE); -- both T and SUBT crash ghdl
    report "T'LEFT = " & to_string(T'LEFT);
    report "T'RIGHT = " & to_string(T'RIGHT);
    report "T'HIGH = " & to_string(T'HIGH);
    report "T'LOW = " & to_string(T'LOW);
    report "T'ASCENDING = " & to_string(T'ASCENDING);
    report "T'IMAGE(ST) = " & T'IMAGE(ST);
    report "T'VALUE(ST) = " & to_string(T'VALUE("33"));
    report "T'POS(ST) = " & to_string(T'POS(ST));
    report "T'VAL(ST) = " & to_string(T'VAL(ST));
    report "T'SUCC(ST) = " & to_string(T'SUCC(ST));
    report "T'PRED(ST) = " & to_string(T'PRED(ST));
    report "T'LEFTOF(ST) = " & to_string(T'LEFTOF(ST));
    report "T'RIGHTOF(ST) = " & to_string(T'RIGHTOF(ST));

    report "A'LEFT = " & to_string(A'LEFT);
    report "A'LEFT(N) = " & to_string(A'LEFT(1));
    report "A'RIGHT = " & to_string(A'RIGHT);
    report "A'RIGHT(N) = " & to_string(A'RIGHT(1));
    report "A'HIGH = " & to_string(A'HIGH);
    report "A'HIGH(N) = " & to_string(A'HIGH(1));
    report "A'LOW = " & to_string(A'LOW);
    report "A'LOW(N) = " & to_string(A'LOW(1));
--  report "A'RANGE = " & to_string(A'RANGE); -- no overloaded function 'to_string'
--  report "A'RANGE(N) = " & to_string(A'RANGE(N));
--  report "A'REVERSE_RANGE = " & to_string(A'REVERSE_RANGE);
--  report "A'REVERSE_RANGE(N) = " & to_string(A'REVERSE_RANGE(N));
    report "A'LENGTH = " & to_string(A'LENGTH);
    report "A'LENGTH(N) = " & to_string(A'LENGTH(1));
    report "A'ASCENDING = " & to_string(A'ASCENDING);
    report "A'ASCENDING(N) = " & to_string(A'ASCENDING(1));

    report "S'DELAYED(ti) = " & to_string(S'DELAYED(ti));
    report "S'STABLE = " & to_string( S'STABLE );
    report "S'STABLE(ti) = " & to_string( S'STABLE(ti) );
    report "S'QUIET = " & to_string( S'QUIET );
    report "S'QUIET(ti) = " & to_string( S'QUIET(ti) );
    report "S'TRANSACTION = " & to_string( S'TRANSACTION );
    report "S'EVENT = " & to_string( S'EVENT );
    report "S'ACTIVE = " & to_string( S'ACTIVE );
    report "S'LAST_EVENT = " & to_string( S'LAST_EVENT );
    report "S'LAST_ACTIVE = " & to_string( S'LAST_ACTIVE );
    report "S'LAST_VALUE = " & to_string( S'LAST_VALUE );
    report "S'DRIVING = " & to_string( S'DRIVING );
    report "S'DRIVING_VALUE = " & to_string( S'DRIVING_VALUE );

    report "E'SIMPLE_NAME = " & attrs_tb'SIMPLE_NAME;
    report "E'INSTANCE_NAME = " & attrs_tb'INSTANCE_NAME;
    report "E'PATH_NAME = " & attrs_tb'PATH_NAME;

    assert false severity failure;

  end process stim_proc;

end attrs_tb_arch;
