@set QUESTA_HOME=C:/questasim64_2021.1
@set QUESTA_BIN_DIR=%QUESTA_HOME%/win64
@set UVMF_HOME=C:/UVMF_2023.4/UVMF_2023.4

C:/Python27/python %UVMF_HOME%/scripts/uvmf_bcr.py questa live:TRUE enable_trlog:True wave_file:wave.do code_cov_enable:1 code_cov_types:sbfec code_cov_target:/hdl_top/DUT. extra_do:"onbreak {resume}; set PrefSource (OpenOnBreak) 0; radix hex showbase; "

pause
