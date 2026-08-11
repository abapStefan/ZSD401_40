CLASS zcl_40_constructor_reihenfole DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_constructor_reihenfole IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   Data ober Type Ref To super1.
   DATA unter   TYPE REF TO sub1.

   create object unter.

   LOOP AT super1=>table INTO DATA(oha).
   out->write(  oha ).
   ENDLOOP.


  ENDMETHOD.
ENDCLASS.
