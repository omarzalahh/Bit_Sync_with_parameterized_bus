module  CDC1  # (parameter  BUS_WIDTH=4,
                            NUM_STAGES=2  )
  (
  input   wire                      RST,
  input   wire                      CLK,
  input   wire  [BUS_WIDTH-1:0]     ASYNC,
  output  reg   [BUS_WIDTH-1:0]     SYNC
  );
  reg [NUM_STAGES-1:0]  flip_flops [BUS_WIDTH-1:0]  ;
  integer i;
  
  always  @ (*)
  begin
    if(!RST)
     SYNC = 'b0;
   else
     for(i=0;i<BUS_WIDTH;i=i+1)
    SYNC[i]=flip_flops[i][NUM_STAGES-1];
  end
  
  always  @ (  posedge CLK or  negedge RST  )
  begin
   if(!RST)
    for(i=0;i<NUM_STAGES;i=i+1)
        begin
          flip_flops[i]          <=  1'b0;
        end
    else
     begin
       if(NUM_STAGES=='b1)
          begin
            for (i=0;i<BUS_WIDTH;i=i+1)
                flip_flops[0][i]  <=  ASYNC[i];
           end
        else
          begin
            for(i=0;i<BUS_WIDTH;i=i+1)
              flip_flops[i]<={flip_flops[i] [NUM_STAGES-2:0],ASYNC[i]};            
          end
      end
  end
endmodule
  
