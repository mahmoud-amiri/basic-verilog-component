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
import server_api_pkg::*;
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
    // Declare the ServerAPI instance
    ServerAPI srv;
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
    // Initialize the ServerAPI instance
    srv = new(); 
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    decoder_in_agent_ae = new("decoder_in_agent_ae", this);
    decoder_sb_ap =new("decoder_sb_ap", this );
  // pragma uvmf custom build_phase begin
    // Initialize the ServerAPI instance
    srv.init("./port.json", "port_A");
    srv.start();
  // pragma uvmf custom build_phase end
  endfunction


  function string int_to_str(int num);
    automatic string str0 = "";
    string digit_str;
    int digit;
    while(num > 0) begin
        digit = num % 10;
        num = num / 10;
        $sformat(digit_str, "%0d", digit);
        str0 = {digit_str, str0};
    end
    return str0;
  endfunction
  // FUNCTION: write_decoder_in_agent_ae
  // Transactions received through decoder_in_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_decoder_in_agent_ae(decoder_in_transaction #() t);
    // pragma uvmf custom decoder_in_agent_ae_predictor begin
    json_assoc_t   data_to_send, received_data;
    string res;
    decoder_in_agent_ae_debug = t;
    $display("################################start########################################");

    `uvm_info("PRED", "Transaction Received through decoder_in_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    decoder_sb_ap_output_transaction = decoder_sb_ap_output_transaction_t::type_id::create("decoder_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  

    data_to_send["input"] = int_to_str(t.in);
    $display(data_to_send["input"]);
    srv.send(data_to_send);

    received_data = srv.receive();
    $display("received_data:");
    $display(received_data["output"]);
    $sscanf(received_data["output"], "%d", decoder_sb_ap_output_transaction.out);
    `uvm_info("PRED", {"Received Data: ", received_data["output"]}, UVM_FULL)

    // Code for sending output transaction out through decoder_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    decoder_sb_ap.write(decoder_sb_ap_output_transaction);
    $display("################################end########################################");
    // pragma uvmf custom decoder_in_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

