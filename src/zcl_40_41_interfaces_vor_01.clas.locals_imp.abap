*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*CLASS lcl_partner DEFINITION.
*
*  PUBLIC SECTION.
*
*ENDCLASS.
*
*CLASS lcl_partner IMPLEMENTATION.

*ENDCLASS.

CLASS lcl_rental DEFINITION.

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_name TYPE string.

    DATA mv_name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_rental IMPLEMENTATION.

  METHOD constructor.

    mv_name = iv_name.

  ENDMETHOD.

ENDCLASS.


CLASS lcl_carrier DEFINITION.

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_name TYPE string.

    DATA mv_name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_carrier IMPLEMENTATION.

  METHOD constructor.

    mv_name = iv_name.

  ENDMETHOD.

ENDCLASS.
