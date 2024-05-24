# AND_output interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

AND_output_PKG         ?= \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg/AND_output_filelist_hvl.f 

AND_output_PKG_HDL         ?= \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg/AND_output_filelist_hdl.f 

AND_output_PKG_XRTL         ?= \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg/AND_output_filelist_xrtl.f 

COMP_AND_output_PKG_TGT_0 = q_comp_AND_output_pkg
COMP_AND_output_PKG_TGT_1 = v_comp_AND_output_pkg
COMP_AND_output_PKG_TGT = $(COMP_AND_output_PKG_TGT_$(USE_VELOCE))

comp_AND_output_pkg: $(COMP_AND_output_PKG_TGT) 

q_comp_AND_output_pkg:
	$(HDL_COMP_CMD) $(AND_output_PKG_HDL)
	$(HVL_COMP_CMD) $(AND_output_PKG)
	$(HDL_COMP_CMD) $(AND_output_PKG_XRTL) 

v_comp_AND_output_pkg:
	$(HVL_COMP_CMD) $(AND_output_PKG_HDL)
	$(HVL_COMP_CMD) $(AND_output_PKG)
	$(VELANALYZE_CMD) $(AND_output_PKG_HDL) 
	$(VELANALYZE_HVL_CMD) $(AND_output_PKG) 
	$(HDL_COMP_CMD) $(AND_output_PKG_XRTL)

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export AND_output_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/interface_packages/AND_output_pkg/dpi

C_FILE_COMPILE_LIST_AND_output_pkg	?= \

O_FILE_COMPILE_LIST_AND_output_pkg ?= $(notdir $(C_FILE_COMPILE_LIST_AND_output_pkg:.c=.o))

GCC_COMP_ARGS_AND_output_pkg	+= -I$(AND_output_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_AND_output_pkg	+= $(AND_output_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_AND_output_pkg	+= \
	 \
 	-o .so

comp_AND_output_pkg_c_files:
	@echo "--------------------------------"
	@echo "Compiling Interface C source"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_COMP_ARGS_AND_output_pkg) $(C_FILE_COMPILE_LIST_AND_output_pkg)
	@echo "--------------------------------"
	@echo "Linking Interface C objects into a shared object"
	@echo "--------------------------------"
	gcc $(GCC_COMP_ARCH) $(GCC_LINK_ARGS_AND_output_pkg) $(O_FILE_COMPILE_LIST_AND_output_pkg)
	@echo "--------------------------------"

