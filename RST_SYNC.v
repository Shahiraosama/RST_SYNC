module RST_SYNC #(parameter STAGES = 2)(

input	wire	CLK,
input	wire	RST,
output	wire	SYNC_RST

);

reg	[STAGES-1:0]	FF;

always@(posedge CLK or negedge RST)
begin

if(!RST)
begin

FF <= 'b0;

end

else
begin

FF <= { FF[STAGES-2:0] , 1}; 


end

end


assign SYNC_RST = FF[STAGES-1] ;
endmodule
