//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the comparator_out package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the comparator_out_configuration class.
//
  `define comparator_out_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } comparator_out_configuration_s;

  `define comparator_out_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function comparator_out_configuration_s to_struct();\
    comparator_out_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( comparator_out_configuration_struct );\
  endfunction

  `define comparator_out_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(comparator_out_configuration_s comparator_out_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = comparator_out_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the comparator_out_transaction class.
//
  `define comparator_out_MONITOR_STRUCT typedef struct packed  { \
  bit [1-1:0] GT ; \
  bit [1-1:0] LT ; \
  bit [1-1:0] EQ ; \
     } comparator_out_monitor_s;

  `define comparator_out_TO_MONITOR_STRUCT_FUNCTION \
  virtual function comparator_out_monitor_s to_monitor_struct();\
    comparator_out_monitor_struct = \
            { \
            this.GT , \
            this.LT , \
            this.EQ  \
            };\
    return ( comparator_out_monitor_struct);\
  endfunction\

  `define comparator_out_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(comparator_out_monitor_s comparator_out_monitor_struct);\
            {\
            this.GT , \
            this.LT , \
            this.EQ  \
            } = comparator_out_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the comparator_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define comparator_out_INITIATOR_STRUCT typedef struct packed  { \
  bit [1-1:0] GT ; \
  bit [1-1:0] LT ; \
  bit [1-1:0] EQ ; \
     } comparator_out_initiator_s;

  `define comparator_out_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function comparator_out_initiator_s to_initiator_struct();\
    comparator_out_initiator_struct = \
           {\
           this.GT , \
           this.LT , \
           this.EQ  \
           };\
    return ( comparator_out_initiator_struct);\
  endfunction

  `define comparator_out_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(comparator_out_initiator_s comparator_out_initiator_struct);\
           {\
           this.GT , \
           this.LT , \
           this.EQ  \
           } = comparator_out_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the comparator_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define comparator_out_RESPONDER_STRUCT typedef struct packed  { \
  bit [1-1:0] GT ; \
  bit [1-1:0] LT ; \
  bit [1-1:0] EQ ; \
     } comparator_out_responder_s;

  `define comparator_out_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function comparator_out_responder_s to_responder_struct();\
    comparator_out_responder_struct = \
           {\
           this.GT , \
           this.LT , \
           this.EQ  \
           };\
    return ( comparator_out_responder_struct);\
  endfunction

  `define comparator_out_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(comparator_out_responder_s comparator_out_responder_struct);\
           {\
           this.GT , \
           this.LT , \
           this.EQ  \
           } = comparator_out_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
