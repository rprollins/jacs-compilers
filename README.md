# JACS: Working with Compilers and Makefiles

JACS is a series of introductory computing sessions aimed at new postgraduate students at the Jodrell Bank Centre for Astrophysics. For more information visit [jbca-jacs.bitbucket.io](https://jbca-jacs.bitbucket.io/).

This session will cover the basic use of compilers when working with code written in C, C++ and Fortran. Starting from simple single-file examples we will discuss compiling and linking as a two-stage process, working with header files, libraries and modules and automating the build process for larger projects using GNU Make.

To work through the examples alongside the slides you must first clone the repository and create a few necessary directories from the command line:

```
git clone git@github.com:rprollins/jacs-compilers.git
cd jacs-compilers
mkdir bin build lib modules
```

By the end of the session you should understand the contents of the [Makefile](Makefile) which can be used to build all examples from the command line:

```
CC=gcc FC=gfortran make all
```
