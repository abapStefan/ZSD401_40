CLASS zcl_40_17_berech_datum_zeit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_17_berech_datum_zeit IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA var_date1 TYPE d.
   DATA var_date2 TYPE d.
   DATA days_between TYPE i.

   var_date1 = '20260717'.
   var_date2 = '20260817'.

   days_between = var_date2 - var_date1.

   out->write( days_between ).

  ENDMETHOD.
ENDCLASS.
