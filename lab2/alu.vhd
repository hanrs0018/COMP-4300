use work.dlx_types.all;
use work.bv_arithmetic.all;

entity alu is 
	generic(prop_delay: Time := 5 ns); --note: test screenshots do not include time delay bc I forgot and added afterwards
	port(operand1, operand2: in dlx_word; operation: in alu_operation_code;
		signed: in bit;
		result: out dlx_word; error: out error_code);
end entity alu;

architecture behavior1 of alu is
begin

	aluProcess: process(operand1, operand2, operation) is

--operations with 4-bit operation input/number value
--add = 0 = 0000 (addu since it catches overflow)
--sub = 1 = 0001 (subu since it catches overflow)
--and = 2 = 0010 
--or = 3 = 0011 
--xor = 4 = 0100 
--mul = e = 14 = 1110 
--bv structure = operation(bv1, bv2, bv_result, overflow)
--no error = 0000 error = 0001

	variable resultv: dlx_word;
	variable over: boolean := false;
	variable slt: boolean := false;
--variable names taken from bva-b.vhd file with arithmetic for operations
	
begin
--add operation
	if operation = "0000" then
--for add,sub,mul the u version is used since we want to continue but notify that there was overflow
	bv_addu(operand1, operand2, resultv, over); 
		if over then
			error <= "0001";
			-- <= is used for signals, := is used for variables
		end if;
	-- signal/variable assignment below learned from youtube video on VHDL
	result <= resultv after prop_delay;

--sub operation
	elsif operation = "0001" then
	bv_subu(operand1, operand2, resultv, over);
		if over then
			error <= "0001";
		end if;
	result <= resultv after prop_delay;

--and operation --> no overflow 
	elsif operation = "0010" then
	resultv := operand1 and operand2;
	result <= resultv after prop_delay;

--or operation --> no overflow
	elsif operation = "0011" then
	resultv := operand1 or operand2;
	result <= resultv after prop_delay;

--xor operation --> no overflow
	elsif operation = "0100" then
	resultv := operand1 xor operand2;
	result <= resultv after prop_delay;

--slt operation --> set less than 
	elsif operation = "1011" then
	slt := bv_lt(operand1, operand2);
	--stack overflow- "why is set on less than an alu operation" page
	--returns 1 if operand1 is less than operand2
		if slt = true then
		result <= x"00000001" after prop_delay;
		else
		result <= x"00000000" after prop_delay;
		end if;

--mul operation 
	elsif operation = "1110" then
	bv_mult(operand1, operand2, resultv, over);
		if over then
			error <= "0001";
		end if;
	result <= resultv after prop_delay;
	
--all other operations can return 0
	else 
	result <= x"00000000";
end if;

end process aluProcess;
end architecture behavior1;

