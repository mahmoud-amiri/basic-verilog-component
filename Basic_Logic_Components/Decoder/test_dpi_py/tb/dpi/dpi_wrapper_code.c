// #include <Python.h>
// #include <stdio.h>

// int call_python_function(const char* module_name, const char* function_name, int* inputs, int num_inputs, int* outputs, int num_outputs) {
//     int result = -1;

//     Py_Initialize();
//     PyObject *pName = PyUnicode_DecodeFSDefault(module_name);
//     PyObject *pModule = PyImport_Import(pName);
//     Py_DECREF(pName);

//     if (pModule != NULL) {
//         PyObject *pFunc = PyObject_GetAttrString(pModule, function_name);
//         if (pFunc && PyCallable_Check(pFunc)) {
//             PyObject *pArgs = PyTuple_New(num_inputs);
//             for (int i = 0; i < num_inputs; i++) {
//                 PyTuple_SetItem(pArgs, i, PyLong_FromLong(inputs[i]));
//             }
//             PyObject *pValue = PyObject_CallObject(pFunc, pArgs);
//             Py_DECREF(pArgs);

//             if (pValue != NULL) {
//                 if (PyTuple_Check(pValue)) {
//                     for (int i = 0; i < num_outputs; i++) {
//                         outputs[i] = (int)PyLong_AsLong(PyTuple_GetItem(pValue, i));
//                     }
//                 } else {
//                     outputs[0] = (int)PyLong_AsLong(pValue);
//                 }
//                 Py_DECREF(pValue);
//             } else {
//                 PyErr_Print();
//                 Py_Finalize();
//                 return -1;
//             }
//         } else {
//             if (PyErr_Occurred())
//                 PyErr_Print();
//             Py_Finalize();
//             return -1;
//         }
//         Py_XDECREF(pFunc);
//         Py_DECREF(pModule);
//     } else {
//         PyErr_Print();
//         Py_Finalize();
//         return -1;
//     }
//     Py_Finalize();
//     return 0;
// }









#include <Python.h>
#include <stdio.h>

int decoder(int input_value) {
    printf("C decoder called with input: %d\n", input_value);
    fflush(stdout);

    Py_Initialize();
    if (!Py_IsInitialized()) {
        fprintf(stderr, "Failed to initialize Python interpreter\n");
        fflush(stderr);
        return 1111;
    }

    // Add the current directory to the Python path
    PyRun_SimpleString("import sys");
    PyRun_SimpleString("sys.path.append('.')");

    // Print the current Python path
    PyObject *sys_path = PySys_GetObject("path");
    PyObject *str_path = PyObject_Str(sys_path);
    const char *cstr_path = PyUnicode_AsUTF8(str_path);
    // printf("Python path: %s\n", cstr_path);
    // fflush(stdout);
    Py_DECREF(str_path);

    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Current working directory: %s\n", cwd);
    } else {
        perror("getcwd() error");
    }
    fflush(stdout);

    PyObject *pModule = PyImport_ImportModule("decoder");
    if (!pModule) {
        PyErr_Print();
        fprintf(stderr, "Failed to import Python module 'decoder'\n");
        fflush(stderr);
        Py_Finalize();
        return 1212;
    }

    PyObject *pFunc = PyObject_GetAttrString(pModule, "decoder");
    if (!pFunc || !PyCallable_Check(pFunc)) {
        PyErr_Print();
        fprintf(stderr, "Failed to get function 'decoder' from module 'decoder'\n");
        fflush(stderr);
        Py_DECREF(pModule);
        Py_Finalize();
        return 1313;
    }

    PyObject *pArgs = PyTuple_Pack(1, PyLong_FromLong(input_value));
    if (!pArgs) {
        PyErr_Print();
        fprintf(stderr, "Failed to create Python argument tuple\n");
        fflush(stderr);
        Py_DECREF(pFunc);
        Py_DECREF(pModule);
        Py_Finalize();
        return 1414;
    }

    PyObject *pValue = PyObject_CallObject(pFunc, pArgs);
    if (!pValue) {
        PyErr_Print();
        fprintf(stderr, "Failed to call Python function 'decoder'\n");
        fflush(stderr);
        Py_DECREF(pArgs);
        Py_DECREF(pFunc);
        Py_DECREF(pModule);
        Py_Finalize();
        return 1515;
    }

    if (PyLong_Check(pValue)) {
        long long result = PyLong_AsLongLong(pValue);
        if (PyErr_Occurred()) {
            PyErr_Print();
            fprintf(stderr, "Failed to convert Python result to C long long\n");
            fflush(stderr);
            Py_DECREF(pArgs);
            Py_DECREF(pValue);
            Py_DECREF(pFunc);
            Py_DECREF(pModule);
            Py_Finalize();
            return 1616;
        }

        printf("C decoder returning output: %lld\n", result);
        fflush(stdout);

        Py_DECREF(pArgs);
        Py_DECREF(pValue);
        Py_DECREF(pFunc);
        Py_DECREF(pModule);
        Py_Finalize();

        return result;
    } else {
        PyErr_Print();
        fprintf(stderr, "Python function did not return a long integer\n");
        fflush(stderr);
        Py_DECREF(pArgs);
        Py_DECREF(pValue);
        Py_DECREF(pFunc);
        Py_DECREF(pModule);
        Py_Finalize();
        return 1717;
    }
}



