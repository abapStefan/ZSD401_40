*"* use this source file for your ABAP unit test classes
class ltcl_1 definition final for testing
  duration SHORT
  risk level HARMLESS.

  PUBLIC SECTION.

   class-METHODS class_constructor.

  private section.
    methods:
      test_summe_1 for testing raising cx_static_check.

    methods:
      test_summe_2 for testing raising cx_static_check.

endclass.


class ltcl_1 implementation.


  method class_constructor.
  data a.
  a = a.

  endmethod.


  method test_summe_1.

    DATA lo_compute TYPE REF TO lcl_compute.

    CREATE OBJECT  lo_compute.

    IF lo_compute IS INITIAL.
    cl_abap_unit_assert=>fail( 'Fehler bei der Instanziierung' ).
    ENDIF.

    lo_compute->summe(
    EXPORTING
      iv_zahl1  =  10
      iv_zahl2  =  20
    IMPORTING
      ev_result = DATA(lv_result) ).

      cl_abap_unit_assert=>assert_equals(
        EXPORTING
          act                  = lv_result
          exp                  = 30
*          ignore_hash_sequence = abap_false
*          tol                  =
*          msg                  =
*          level                = if_abap_unit_constant=>severity-medium
*          quit                 = if_abap_unit_constant=>quit-test
*        RECEIVING
*          assertion_failed     =
      ).

  endmethod.


  method test_summe_2.

  DATA lo_compute TYPE REF TO lcl_compute.

    CREATE OBJECT  lo_compute.

    IF lo_compute IS INITIAL.
    cl_abap_unit_assert=>fail( 'Fehler bei der Instanziierung' ).
    ENDIF.

    lo_compute->summe(
    EXPORTING
      iv_zahl1  =  50
      iv_zahl2  =  150
    IMPORTING
      ev_result = DATA(lv_result) ).

      cl_abap_unit_assert=>assert_equals(
        EXPORTING
          act                  = lv_result
          exp                  = 200
*          ignore_hash_sequence = abap_false
*          tol                  =
*          msg                  =
*          level                = if_abap_unit_constant=>severity-medium
*          quit                 = if_abap_unit_constant=>quit-test
*        RECEIVING
*          assertion_failed     =
      ).




  endmethod.

endclass.
