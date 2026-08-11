*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

INTERFACE lif_partner.

  METHODS get_name RETURNING VALUE(rv_name) TYPE string.

ENDINTERFACE.

CLASS lcl_rental DEFINITION.

  PUBLIC SECTION.

    INTERFACES lif_partner.

    METHODS constructor IMPORTING iv_name TYPE string.

    DATA mv_name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_rental IMPLEMENTATION.

  METHOD constructor.

    mv_name = iv_name.

  ENDMETHOD.

  METHOD lif_partner~get_name.

   rv_name = mv_name.

  ENDMETHOD.

ENDCLASS.


CLASS lcl_carrier DEFINITION.

  PUBLIC SECTION.

    INTERFACES lif_partner.

    METHODS constructor IMPORTING iv_name TYPE string.

    DATA mv_name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_carrier IMPLEMENTATION.

  METHOD constructor.

    mv_name = iv_name.

  ENDMETHOD.

  METHOD lif_partner~get_name.

   rv_name = mv_name.

  ENDMETHOD.

ENDCLASS.
