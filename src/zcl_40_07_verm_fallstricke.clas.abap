CLASS zcl_40_07_verm_fallstricke DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_07_verm_fallstricke IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Erfolgreiche Zuweisung Abbild 39

    DATA var_string TYPE string.
    DATA var_int    TYPE i.
    DATA var_date   TYPE d.

    var_string = `12345`.
    var_int = var_string.

     out->write( var_int ).

    var_string = '20260717'.
    var_date = var_string.

    out->write( var_date ).





  ENDMETHOD.
ENDCLASS.
