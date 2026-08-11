CLASS zcl_40_13_typconv_impli_erzw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_13_typconv_impli_erzw IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA var TYPE c LENGTH 10.

*  lcl_class=>mach_mal( var ).            " Fehler: var hat den Typ c und ist inkompatibel mit dem Parameter

   lcl_class=>mach_mal( i_string = conv #( var ) ).

  ENDMETHOD.
ENDCLASS.
