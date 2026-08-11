*"* use this source file for your ABAP unit test classes
CLASS ltcl_test DEFINITION FOR TESTING
                          RISK LEVEL HARMLESS
                          DURATION SHORT.

  PRIVATE SECTION.

    METHODS test_success   FOR TESTING.

    METHODS test_exception FOR TESTING.

ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

  METHOD test_success.

* Vorbereitung: Eine beliebige carrier_id aus der Datenbank auslesen
**********************************************************************
    SELECT SINGLE
           FROM /dmo/carrier
           FIELDS carrier_id
         INTO @DATA(carrier_id).

    IF sy-subrc <> 0.
      " No data in table /DMO/CARRIER, stop testing
      cl_abap_unit_assert=>fail( `Für den Test mindestens ein Eintrag erforderlich in DB table /DMO/CARRIER` ).
    ENDIF.

* Führt den Methodentest durch lcl_data=>get_carrier( )
**********************************************************************

    TRY.
        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).

      CATCH cx_abap_invalid_value.

        cl_abap_unit_assert=>fail(
          msg    =  `Unzulässige Ausnahme`
*      level  = if_abap_unit_constant=>severity-medium
*      quit   = if_abap_unit_constant=>quit-test
          detail = `Methode lcl_data=>get_carrier( ) löst eine Ausnahme aus obwohl dies nicht vorgesehen war`
        ).

        DATA var1 TYPE i.

        DATA var2 TYPE i.

        cl_abap_unit_assert=>assert_equals(
            act                  = var1
            exp                  = var2
*       tol                  =
*       msg                  = `Put a short message text here`
*       level                = if_abap_unit_constant=>severity-medium
*       quit                 = if_abap_unit_constant=>quit-test
        ).

        cl_abap_unit_assert=>fail(
          msg    = `Geben Sie einen Kurzen Text ein`
          level  = if_abap_unit_constant=>severity-medium
          quit   = if_abap_unit_constant=>quit-test
          detail = `Optional gib eine längere Erklärung ein`
        ).

    ENDTRY.

  ENDMETHOD.

  METHOD test_exception.

* Gib eine carrier_id an, die (hoffentlich) noch nicht in der Datenbank  * **vorhanden ist
**********************************************************************
    CONSTANTS c_wrong_carrier_id TYPE /dmo/carrier_id VALUE 'XX'.

* Vorbereitung: Stellt sicher, dass der Träger nicht in der Datenbank **vorhanden ist
**********************************************************************
    SELECT SINGLE
           FROM /dmo/carrier
           FIELDS carrier_id
           WHERE carrier_id = 'LH'
         INTO @DATA(carrier_id).

    IF sy-subrc = 0.
      " Carrier  exists in DB table /DMO/CARRIER, stop testing
      cl_abap_unit_assert=>fail(
        msg    = |Carrier { c_wrong_carrier_id } existiert in /DMO/CARRIER|
        level  = if_abap_unit_constant=>severity-high
        quit   = if_abap_unit_constant=>quit-test
        detail = `Wenn DB table /DMO/CARRIER einen Eintrag enthält` &&
                 |mit carrier_id = '{ c_wrong_carrier_id }'| &&
                 `ist es nicht möglich die Ausnahme zu prüfen`
       ).
    ENDIF.

* Führt den Test der Methode lcl_data=>get_carrier() durch
**********************************************************************

    TRY.
        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).

        cl_abap_unit_assert=>fail(
      msg    =  `No exception`
*      level  = if_abap_unit_constant=>severity-medium
*      quit   = if_abap_unit_constant=>quit-test
      detail = `Methode lcl_data=>get_carrier( ) löst keine Ausnahme aus obwohl sie dies tun sollte`
    ).

      CATCH cx_abap_invalid_value.

    ENDTRY.

  ENDMETHOD.


ENDCLASS.

