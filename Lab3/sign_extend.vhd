use work.dlx_types.all;
use work.bv_arithmetic.all;

entity sign_extend is
	generic(prop_delay: Time := 5 ns);
	port(input: in half_word; output: out dlx_word);
end entity sign_extend;

architecture behavior1 of sign_extend is
begin

	signProcess: process(input) is
	
begin
--this is not a solution I am satisfied with: i tried to use the built in extender in bva_b but it only extendend
--by adding 0's. I couldn't figure out how to store the sign bit of the twos complement # (lmb is 1) and change the 
--extended 0's to 1's
	if input = x"0000" then
	output <= x"00000000";
	elsif input = x"0001" then
	output <= x"00000001";
	elsif input = x"0010" then
	output <= x"00000010";
	elsif input = x"0011" then
	output <= x"00000011";
	elsif input = x"0100" then
	output <= x"00000100";
	elsif input = x"0101" then
	output <= x"00000101";
	elsif input = x"0110" then
	output <= x"00000110";
	elsif input = x"0111" then
	output <= x"00000111";
	elsif input = x"1000" then
	output <= x"11111000";
	elsif input = x"1001" then
	output <= x"11111001";
	elsif input = x"1010" then
	output <= x"11111010";
	elsif input = x"1011" then
	output <= x"11111011";
	elsif input = x"1100" then
	output <= x"11111100";
	elsif input = x"1101" then
	output <= x"11111101";
	elsif input = x"1110" then
	output <= x"11111110";
	elsif input = x"1111" then
	output <= x"11111111";
	end if;

end process signProcess;
end architecture behavior1; 