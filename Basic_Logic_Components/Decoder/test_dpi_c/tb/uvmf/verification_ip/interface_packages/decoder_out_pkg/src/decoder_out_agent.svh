//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// DESCRIPTION: Protocol specific agent class definition
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decoder_out_agent #(
     int decoder_out_WIDTH = 2**8
     ) extends uvmf_parameterized_agent #(
                    .CONFIG_T(decoder_out_configuration #(
                              .decoder_out_WIDTH(decoder_out_WIDTH)
                              )),
                    .DRIVER_T(decoder_out_driver #(
                              .decoder_out_WIDTH(decoder_out_WIDTH)
                              )),
                    .MONITOR_T(decoder_out_monitor #(
                               .decoder_out_WIDTH(decoder_out_WIDTH)
                               )),
                    .COVERAGE_T(decoder_out_transaction_coverage #(
                                .decoder_out_WIDTH(decoder_out_WIDTH)
                                )),
                    .TRANS_T(decoder_out_transaction #(
                             .decoder_out_WIDTH(decoder_out_WIDTH)
                             ))
                    );

  `uvm_component_param_utils( decoder_out_agent #(
                              decoder_out_WIDTH
                              ))

// pragma uvmf custom class_item_additional begin
// pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
  // FUNCTION: build_phase
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    if (configuration.active_passive == ACTIVE) begin
      // Place sequencer handle into configuration object
      // so that it may be retrieved from configuration 
      // rather than using uvm_config_db
      configuration.sequencer = this.sequencer;
    end
  endfunction
  
endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

