//Forwarding unit

module forwarding_unit(
	output reg [1:0] forward_A_mux, forward_B_mux, 
	output reg forward_C_mux, // one bit 2-1 mux for dataWrite input of Data memory.
	input [4:0] ID_EX_reg_rs, ID_EX_reg_rt, // src reg from execute stage
	input [4:0] EX_MEM_reg_rd, MEM_WB_reg_rd, //dest reg from memory stage register
	input MEM_regWrite, WB_regWrite, Data_memWrite); //control bit from memory and writeback stage

always @(*)
	begin
	// EX hazard :: 
		if((MEM_regWrite == 1)&&(EX_MEM_reg_rd != 0)
			&&(EX_MEM_reg_rd == ID_EX_reg_rs))
				forward_A_mux <= 2'b10;
		/*else if((MEM_regWrite == 1)&&(EX_MEM_reg_rd != 0)
			&&(EX_MEM_reg_rd == ID_EX_reg_rt))
				forward_B_mux <= 2'b10;*/
			
	// MEM hazard :: 
		else if((WB_regWrite == 1)&&(MEM_WB_reg_rd != 0) 
		&& ~(MEM_regWrite == 1 && (EX_MEM_reg_rd != 0) && (EX_MEM_reg_rd != ID_EX_reg_rs)) 
		&& (MEM_WB_reg_rd == ID_EX_reg_rs))
				forward_A_mux <= 2'b01;
		/*else if((WB_regWrite == 1)&&(MEM_WB_reg_rd != 0)
			&& ~(MEM_regWrite == 1 && (EX_MEM_reg_rd != 0)
			&& (EX_MEM_reg_rd != ID_EX_reg_rt))	&& (MEM_WB_reg_rd == ID_EX_reg_rt))	
				forward_B_mux <= 2'b01;*/
		else
			forward_A_mux <= 2'b00;
			//forward_B_mux <= 2'b00;	




		if((MEM_regWrite == 1)&&(EX_MEM_reg_rd != 0)
			&&(EX_MEM_reg_rd == ID_EX_reg_rt))
				forward_B_mux <= 2'b10;
			

		else if((WB_regWrite == 1)&&(MEM_WB_reg_rd != 0)
			&& ~(MEM_regWrite == 1 && (EX_MEM_reg_rd != 0)
			&& (EX_MEM_reg_rd != ID_EX_reg_rt))	&& (MEM_WB_reg_rd == ID_EX_reg_rt))	
				forward_B_mux <= 2'b01;
		
		else
			forward_B_mux <= 2'b00;	

			
			
	// for hazard in case of load immidiately followed by store
	/* this need additional mux at the dataWrite input of Data Memory to select
	   data directly when no hazard(forward_C_mux = 0) 
	   or with hazard (forward_C_mux = 1).
	*/
		if((Data_memWrite == 1)&&(MEM_WB_reg_rd != 0)
			&&(MEM_WB_reg_rd == ID_EX_reg_rs))
				forward_C_mux <= 1'b1;
		else if((Data_memWrite == 1)&&(MEM_WB_reg_rd != 0)
			&&(MEM_WB_reg_rd == ID_EX_reg_rt))
				forward_C_mux <= 1'b1;
		else
			forward_C_mux <= 1'b0;				
				
				
				
end				
endmodule