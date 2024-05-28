# import os
# import shutil
# from cffi import FFI

# ffi = FFI()

# ffi.cdef("""
# int call_python_function(const char* module_name, const char* function_name, int* inputs, int num_inputs, int* outputs, int num_outputs);
# """)

# ffi.set_source("general_wrapper", """
# int call_python_function(const char* module_name, const char* function_name, int* inputs, int num_inputs, int* outputs, int num_outputs);
# """, 
# sources=["./.matool/dpi_wrapper_code.c"],
# libraries=["python312"],  # Ensure this matches your Python version
# library_dirs=[r"C:\Users\mamir\AppData\Local\Programs\Python\Python312\libs"],  # Replace with the actual path to your Python libs
# include_dirs=[r"C:\Users\mamir\AppData\Local\Programs\Python\Python312\include"]  # Replace with the actual path to your Python include
# )

# ffi.compile()

# # Move the generated shared library to the desired directory
# build_dir = "."
# dest_dir = r".\tb\dpi"  # Replace with your desired directory

# # Ensure the destination directory exists
# os.makedirs(dest_dir, exist_ok=True)

# # Find the generated .pyd file
# shutil.copy("./.matool/dpi_wrapper_code.c", r".\tb\dpi")
# for filename in os.listdir(build_dir):
#     if filename.startswith("general_wrapper") and filename.endswith(".pyd"):
#         src_path = os.path.join(build_dir, filename)
#         dest_path = os.path.join(dest_dir, filename)
#         shutil.move(src_path, dest_path)
#         print(f"Moved {src_path} to {dest_path}")
#         break






import os
import shutil
from cffi import FFI

ffi = FFI()

ffi.cdef("""
int decoder(int input_value);
""")

ffi.set_source("general_wrapper", """
int decoder(int input_value);
""", 
sources=["./.matool/dpi_wrapper_code.c"],
libraries=["python312"],  # Ensure this matches your Python version
library_dirs=[r"C:\Users\mamir\AppData\Local\Programs\Python\Python312\libs"],  # Replace with the actual path to your Python libs
include_dirs=[r"C:\Users\mamir\AppData\Local\Programs\Python\Python312\include"]  # Replace with the actual path to your Python include
)

ffi.compile()

# Move the generated shared library to the desired directory
build_dir = "."
dest_dir = r".\tb\dpi"  # Replace with your desired directory

# Ensure the destination directory exists
os.makedirs(dest_dir, exist_ok=True)

# Find the generated .pyd file
shutil.copy("./.matool/dpi_wrapper_code.c", r".\tb\dpi")
for filename in os.listdir(build_dir):
    if filename.startswith("general_wrapper") and filename.endswith(".pyd"):
        src_path = os.path.join(build_dir, filename)
        dest_path = os.path.join(dest_dir, filename)
        shutil.move(src_path, dest_path)
        print(f"Moved {src_path} to {dest_path}")
        break