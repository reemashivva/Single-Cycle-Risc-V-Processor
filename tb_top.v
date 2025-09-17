module tb_top;

    reg clk, reset;
    
    top UUT (
        .clk(clk), 
        .reset(reset)
    );

    // Clock generation
    initial begin
        clk = 0;
    end

    always #50 clk = ~clk; 

    // Reset generation
    initial begin
        reset = 1'b1;
        #50;
        reset = 1'b0; 
        #5200; 
        $finish; 
    end
    
    
    
    

endmodule
