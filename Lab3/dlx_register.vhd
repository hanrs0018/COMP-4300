use work.dlx_types.all;
use work.bv_arithmetic.all;

entity dlx_register is
	generic(prop_delay: Time := 5 ns);
	port(in_val: in dlx_word; clock: in bit; out_val: out
dlx_word);
end entity dlx_register;

architecture behavior1 of dlx_register is
begin

	dlxProcess: process(in_val, clock) is

begin

	if clock = '1' then
		out_val <= in_val after prop_delay;
	end if;
	elsif clock = '0' then
		out_val <= out_val after prop_delay;
	end if;
end process dlxProcess;
end architecture behavior1;

