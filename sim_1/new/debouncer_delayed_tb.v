`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:11:55 AM
// Design Name: 
// Module Name: debouncer_delayed_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer_delayed_tb();
    
    reg clk;
    reg reset_n;
    reg noisy;
    wire debounced;
    wire p_edge;
    wire n_edge;
    wire any_edge;
    integer i;
    
    //Instantiate unit under test
    debouncer_delayed uut(
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
    
        .debounced(debounced),
        .p_edge(p_edge),
        .n_edge(n_edge),
        .any_edge(any_edge)
    );
    
    localparam Time = 10;
    
    //genarating clk signal
    initial begin
        clk = 0;
        forever #(Time / 2) clk = ~clk;
    end
    
    localparam DELAY = 50_000_000;
    
    // issue 
    initial begin
        reset_n = 1'b0;
        noisy = 1'b0;
        
        
        #2
        reset_n = 1'b1;
        
        repeat(2) @(negedge clk);
        noisy = 1'b1;
        
        #(DELAY);
        noisy = 1'b0;
        
        #(DELAY);
        repeat (20) @(negedge clk);
        for(i = 0; i < 5; i =  i +1)
            #(DELAY/40)  noisy = ~noisy;
        
        #(DELAY/2);
        for(i = 0; i < 5; i =  i +1)
            #(DELAY/40)  noisy = ~noisy;
        
        #(DELAY/2);
        noisy = ~noisy;
        for(i = 0; i < 5; i =  i +1)
            #(DELAY/40)  noisy = ~noisy;
            
        #(DELAY/2);
        noisy = ~noisy;
          
        #(DELAY/2);
        for(i = 0; i < 6; i =  i +1)
            #(DELAY/40)  noisy = ~noisy;
        
        #(DELAY/2);
        noisy = 1'b0;
        
         #(DELAY/2) $stop;
    end
    
    
    
endmodule
