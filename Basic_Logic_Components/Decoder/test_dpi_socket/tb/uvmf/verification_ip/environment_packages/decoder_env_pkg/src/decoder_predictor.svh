//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   decoder_in_agent_ae receives transactions of type  decoder_in_transaction #()
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  decoder_sb_ap broadcasts transactions of type decoder_out_transaction #()
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
import "DPI-C" function void dpi_socket_server_init();
import "DPI-C" function void dpi_socket_server_accept();
import "DPI-C" function void dpi_socket_server_send(input string message);
import "DPI-C" function void dpi_socket_server_receive(output string buffer);
import "DPI-C" function void dpi_socket_server_close();

class decoder_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component,
   int unsigned decoder_out_WIDTH = 256
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( decoder_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_decoder_in_agent_ae #(decoder_in_transaction #(), decoder_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) decoder_in_agent_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(decoder_out_transaction #()) decoder_sb_ap;


  // Transaction variable for predicted values to be sent out decoder_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef decoder_out_transaction #() decoder_sb_ap_output_transaction_t;
  decoder_sb_ap_output_transaction_t decoder_sb_ap_output_transaction;
  // Code for sending output transaction out through decoder_sb_ap
  // decoder_sb_ap.write(decoder_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  decoder_in_transaction #() decoder_in_agent_ae_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    decoder_in_agent_ae = new("decoder_in_agent_ae", this);
    decoder_sb_ap =new("decoder_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_decoder_in_agent_ae
  // Transactions received through decoder_in_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_decoder_in_agent_ae(decoder_in_transaction #() t);
    // pragma uvmf custom decoder_in_agent_ae_predictor begin
    decoder_in_agent_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through decoder_in_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    decoder_sb_ap_output_transaction = decoder_sb_ap_output_transaction_t::type_id::create("decoder_sb_ap_output_transaction");
    

    string buffer;
    dpi_socket_server_init();
    dpi_socket_server_accept();

    // Example of sending and receiving messages
    dpi_socket_server_send("Hello from UVM test bench");
    dpi_socket_server_receive(buffer);
    $display("Received from client: %s", buffer);

    // Close the sockets
    dpi_socket_server_close();


    decoder_sb_ap.write(decoder_sb_ap_output_transaction);
    // pragma uvmf custom decoder_in_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

