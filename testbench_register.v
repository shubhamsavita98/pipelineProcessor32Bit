
module testbench_register;

	// define wires and regs
	wire [31:0] Read_d1, Read_d2;
	
	reg [31:0] Data;
	reg [4:0] Read_r1, Read_r2, Write_r;
	reg RegWrite;
	reg clk;


	// instantiate uut
	Register_Block REGISTER(Read_d1, Read_d2, Data, Read_r1, Read_r2, Write_r, RegWrite, clk);
	
    //initializing reg memory content to 0.
	integer i;	
	initial
		for(i=0; i<32; i=i+1)
		    REGISTER.reg_s[i] = 32'b0;
			
	// stimulation
	initial
		begin
			
			Read_r1 <= 0;
			Read_r2 <= 1;
			Write_r <= 2;
			RegWrite <= 0;
			clk <= 0;
			Data <= 20;
			
			#20 
			Read_r1 <= 8;
			Read_r2 <= 15;
			Data <= 40;
	
			#20 
			Read_r1 <= 5;
			Read_r2 <= 9;
			RegWrite <= 1;


			#20
			Read_r1 <= 12;
			Read_r2 <= 10;
			RegWrite <= 0;
			
			#20
			Read_r1 <= 7;
			Read_r2 <= 13;
			Data <= 35;
			RegWrite <= 1;
                        
                        #20 for(i=0; i<15; i=i+1) //displaying memory content from 0 to 14.
		                $display("Register_Mem[%2d] = %2d", i, REGISTER.reg_s[i]);
				// %2d is for 2 decimal place value of indices.
			#200 $stop;
		
		end 
		
	always 
	    begin 
		#5 clk <= ~clk;
	    end 

	initial
		$monitor("Time:%d, Read_d1=%d, Read_d2=%d, Data=%d, Read_r1=%d, Read_r2=%d,\
		   Write_r=%d, RegWrite=%d, clk=%d", $time, Read_d1, Read_d2, Data, Read_r1, Read_r2, Write_r, RegWrite, clk);

endmodule 