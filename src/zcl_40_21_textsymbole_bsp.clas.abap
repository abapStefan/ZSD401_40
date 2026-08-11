 CLASS zcl_40_21_textsymbole_bsp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_21_textsymbole_bsp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  Out->write( 'Employee' ).           " Textliteral keine Änderung möglich
  out->write( Text-001 ).             " mit strg + 1 kann auch der text hier geladen werden

  out->write( cl_abap_context_info=>get_system_date(  ) ).
  out->write( 'Manager'(mng) ).       " übersichtlicher




  ENDMETHOD.
ENDCLASS.
