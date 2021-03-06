use work.dlx_types.all;
use work.bv_arithmetic.all;

entity add4 is
	generic(prop_delay: Time := 5 ns);
	port(input: in dlx_word; output: out dlx_word);
end entity add4;

architecture behavior1 of add4 is
begin

addProcess: process(input) is
--used logic from alu bv_addu from lab2
variable resultv: dlx_word := x"00000000";
variable over: boolean := false;

begin

bv_addu(x"00000004", input, resultv, over);
output <= resultv after prop_delay;

end process addProcess;
end architecture behavior1;