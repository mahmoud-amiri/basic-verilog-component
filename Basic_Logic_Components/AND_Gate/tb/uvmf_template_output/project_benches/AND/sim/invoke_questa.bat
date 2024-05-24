@set QUESTA_HOME=C:/questasim64_2021.1
@set QUESTA_BIN_DIR=%QUESTA_HOME%/win64
@set UVMF_HOME=C:/UVMF_2023.4/UVMF_2023.4

vsim -i -do "do compile.do; do run.do"

pause