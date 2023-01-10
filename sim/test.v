module rest (); 
   
    wire [31:0] data_out_0;
    wire en;
    wire done;
    
    reg [2:0] i;
    reg [4:0] j;
    reg clk;
    reg [31:0] data_in_0;
    reg reset;
    reg [31:0] data_kernel;
    reg [31:0] data [15:0];    
    reg [31:0] kernel [2:0];
    
    computing_core _computing_core( 
        .clk(clk),
        .reset(reset),
        .data_kernel(data_kernel),
        .data_in_0(data_in_0),
        .data_out_0(data_out_0),
    
        .done(done),
        .en(en)
    );

    initial
    begin
        reset = 1;
        i = 0;
        j = 0;
        clk = 0;
        data[0] = 0;
        data[1] = 1;
        data[2] = 2;
        data[3] = 3;
        data[4] = 4;
        data[5] = 5;
        data[6] = 6;
        data[7] = 7;
        data[8] = 8;
        data[9] = 9;
        data[10] = 10;
        data[11] = 11;
        data[12] = 12;
        data[13] = 13;
        data[14] = 14;
        data[15] = 15;
        
        
        
        kernel [0] = 1;
        kernel [1] = 2;
        kernel [2] = 3;
        
        forever
        begin
            #1 clk = ~clk;
        end
    end
    
    initial
    begin
        #6 reset = 0;
        #1 reset = 1;
    end
    
    always @(posedge clk or negedge reset)
    begin
        if (!reset)
        begin
            i <= 0;
            j <= 1;
            data_in_0 <= data[0];
        end
        else
        begin
            if ((i < 3))
            begin
                data_kernel = kernel [i];
                i <= i + 1;
            end
            
            if (j < 15 && en == 1)
            begin
                data_in_0 <= data [j];
                j <= j + 1;
            end
        end
    end
endmodule