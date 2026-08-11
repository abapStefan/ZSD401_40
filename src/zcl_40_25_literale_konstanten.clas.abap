CLASS zcl_40_25_literale_konstanten DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_25_literale_konstanten IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  CONSTANTS c_number TYPE i VALUE 12345.

  SELECT FROM /dmo/carrier

       FIELDS  'Hello' AS character,
                  1    AS integer1,
                 -1    AS integer2,

       @c_number AS Konstante        " @ bei Konstanten obligatorisch

    INTO TABLE @DATA(result).


    out->write( result ).           " 16 Einträge weil Tabelle Carrier 16 Einträge hat

  ENDMETHOD.
ENDCLASS.
