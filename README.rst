The EASY macros family
======================

release 5.2

.. image:: ./easy.png

`(http://www.kidsdomain.com/clip/) <http://www.kidsdomain.com/clip/>`__

**Easyeqn:** a brief description
--------------------------------

The package **Easyeqn** introduces some equation environments that
are useful to simplify equation editing. It uses a syntax similar to
the array environment to define the column alignment.

The label field is fully customizable. A package option allows
equation numbering only of the equations that were labeled and
referenced. If required a warning is prompted when equations are
labelled but not referenced.

Some additional macros are also included to facilitate the typing of
formulae.

The environments **equation** and **eqnarray** are improved and
substituted by the new environments **EQ** and **EQA**, thus allowing
the use of **array** like sintax to specify column alignment within
equations.

Environment **EQ** and **EQA** can be mixed with standard
**equation** and **eqnarray**.

| `PDF <doc/easyeqn/doceqn.pdf>`__ documentation


**Easymat, Easybmat, Easytable:** a brief description
-----------------------------------------------------

The aim of the above three packages is basically to simplify block
matrices or tables writing. The main features are the following:

The macros are reentrant so that it is possible to build block
matrices with block matrices as entries and so forth.

Rows height and column width can be enforced to be the same.

It is possible to specify minimum size for cells or block matrix (or
table).

It is possible to specify many kind of rules between rows and
columns.

It is possible to specify paths of rules from within a block matrix
or table using a *turtle graphycs* sintax. This option is
particularly useful when difficult splitting of a block matrix is
needed: for example in describing Gauss elimination algorithm.

| `PDF <doc/easymat/docmat.pdf>`__ documentation for EasyMat
| `PDF <doc/easybmat/docbmat.pdf>`__ documentation for EasyBmat
| `PDF <doc/easytable/doctable.pdf>`__ documentation for EasyTable


**Easyvector:** a brief description
-----------------------------------

**Easyvector** is a macro package that provides a **C**-like syntax
to write vectors and matrices components.

| `PDF <doc/easyvector/docvector.pdf>`__ documentation for EasyVector

**Easybib:** a brief description
--------------------------------

**Easybib** is a simple sintax macro package for writing custom-made
bibliographies. The scope of this macro package is to emulate and to
extend the bibliography style of *AMSTeX*. It can easily customize
the format of the references.

| `PDF <doc/easybib/docbib.pdf>`__ documentation for EasyVBib

.. note::

    This package is outclassed by BibTex.

Package contents
----------------

The style file files are the following:

| ``easy.sty``
| ``easyeqn.sty``
| ``easybmat.sty``
| ``easymat.sty``
| ``easytable.sty``
| ``easyvector.sty``
| ``easybib.sty``

- ``easy.sty`` is a file which contains common definitions for all the packages.
  It is included from the others style files.

- ``easyeqn.sty`` introduces some equation environments that simplify writing
  of equations.  It uses a syntax similar to the array environment to
  define the column alignment.  The label field is fully customizable.  A
  package option permits to number only those equations that were `labeled
  and referenced`.  Some additional macros are also included to facilitate
  typing of formulae.

- ``easymat.sty`` and easybmat.sty are useful for writing block matrices, with
  equal column widths or equal rows heights or both, with various kinds of
  rules~(lines) between rows and columns.  It uses an array/tabular-like
  syntax.

- ``easytable.sty`` is a macro package for writing tables, with equal column
  widths or equal rows heights or both, with various kinds of rules~(lines)
  between rows and columns.  It uses an array/tabular-like syntax.

- ``easyvector.sty`` is a simple macro package that provides a C-like syntax
  for writing vectors or matrices.

- ``easybib.sty`` introduces some new items for easy customization of the
  bibliography.
