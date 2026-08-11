CLASS zcl_40_11_fallstrick_inline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_11_fallstrick_inline IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Fallstricke von inline Deklaration

  DATA(result1) = 5 * 10.

   out->write( |5 * 10 = { result1 }| ).       " Result1 ist vom Typ I Ergebnis ist eine ganze zahl


 DATA(result2) = 1 / 8.

   out->write( |5 / 10 = { result2 }| ).       " Result2 ist vom Typ I Ergebnis wird gerundet

  ENDMETHOD.
ENDCLASS.
