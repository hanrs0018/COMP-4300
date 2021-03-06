use work.dlx_types.all;
use work.bv_arithmetic.all;

entity regfile is
	port(read_notwrite, clock: in bit;
	regA, regB: in register_index;
	data_in: in dlx_word;
	dataA_out, dataB_out: out dlx_word);
end entity regfile;

architecture behavior1 of regfile is
begin
	
	regProcess: process(read_notwrite, clock, regA, regB, data_in) is
	type regArr is array(0 to 31) of dlx_word;
	--i think this is how to declare an array here, but i keep getting signal errors that i don't know 
	--how to resolve to store registers into array
	--ex: illegal target for signal/signal assignment errors
	
begin
--if clock goes high, everything happens: decide if you're doing a read or a write
--read: look at values in regA and regB, collect from array of dlx_word, and put them on dataA_out and dataB_out. clock goes low
--write: get value at data_in and put in array of dlx_word. nothing is presented

if clock = '1' then
	
	if read_notwrite = '0' then
	--get value at data_in and put in array
		
	elsif read_notwrite = '1' then
	--put regA in dataA_out
	--put regB in dataB_out
	end if;

end if;

end process regProcess;
end architecture behavior1;
