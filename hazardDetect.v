// Hazard Detection Unit //load-used hazard.

module hazardDetector(
		output reg ctrl_mux, pcWrite, ifid_writeReg,
        input [4:0] ID_EX_regRt, IF_ID_regRs, IF_ID_regRt,
		input ID_EX_memRead, reset);
	

always@(*) begin
	
	if(reset == 0) begin
		if((ID_EX_memRead == 1) && 
			((ID_EX_regRt == IF_ID_regRs) || (ID_EX_regRt == IF_ID_regRt)))
			begin
				ctrl_mux <= 0;
				pcWrite <= 0;
				ifid_writeReg <= 0;
			end

		
		else begin
				ctrl_mux <= 1;
				pcWrite <= 1;
				ifid_writeReg <= 1;				
			end
		end	
    else begin
		ctrl_mux <= 0;
		pcWrite <= 0;
		ifid_writeReg <= 0;
		end
end
endmodule