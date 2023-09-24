// cell count
`define CELLS_X 32
`define CELLS_Y (`CELLS_X / 16 * 9)

// top level module
module top(
    input wire clk, overwrite,
    input wire cells_in[`CELLS_Y-1:0][`CELLS_X-1:0],
    output reg cells[`CELLS_Y-1:0][`CELLS_X-1:0]
);
    reg cells_bak[`CELLS_Y-1:0][`CELLS_X-1:0];
    generate
        genvar i, j;
        for (i = 0; i < `CELLS_Y; i = i + 1) begin
            for (j = 0; j < `CELLS_X; j = j + 1) begin
                assign cells[i][j] = 0;

                // update cells which have exactly 8 neighbours.
                // ignore cells which are present at the edges of the sim.
                if (i > 0 && i < `CELLS_Y-1 && j > 0 && j < `CELLS_X-1) begin
                    // copy a user defined state into the
                    // cells when overwrite is high.
                    always @(posedge overwrite) begin
                        assign cells_bak[i][j] = cells_in[i][j];
                        assign cells[i][j] = cells_in[i][j];
                    end

                    // run sim
                    always @(posedge clk) begin
                        // for now, just flip every cell's state
                        cells[i][j] = ~cells_bak[i][j];
                        cells_bak[i][j] = cells[i][j];
                    end
                end
            end
        end
    endgenerate
endmodule
