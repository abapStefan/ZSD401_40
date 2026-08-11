*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcx_no_connection definition INHERITING FROM cx_static_check.

  public section.

      INTERFACES if_t100_message .

       METHODS constructor
        IMPORTING
          textid LIKE if_t100_message=>t100key OPTIONAL
          previous LIKE previous OPTIONAL
          airlineid TYPE /dmo/carrier_id OPTIONAL
          connectionnumber TYPE /dmo/connection_id OPTIONAL.

      constants:
        begin of lcx_no_connection,
          msgid type symsgid value 'ZS4D401_EXCEPTIONS',
          msgno type symsgno value '001',
          attr1 type scx_attrname value 'AIRLINEID',
          attr2 type scx_attrname value 'CONNECTIONNUMBER',
          attr3 type scx_attrname value 'attr3',
          attr4 type scx_attrname value 'attr4',
        end of lcx_no_connection.

      DATA airlineid TYPE /dmo/carrier_id READ-ONLY.
      DATA connectionnumber TYPE /dmo/connection_id READ-ONLY.



endclass.

class lcx_no_connection implementation.

  method constructor.

    super->constructor( previous = previous ).

    me->airlineid = airlineid.
    me->connectionnumber = connectionnumber.

    clear me->textid.
    if textid is initial.
      if_t100_message~t100key = lcx_no_connection.
    else.
      if_t100_message~t100key = textid.
    endif.

  endmethod.

endclass.




CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_airlineid        TYPE /dmo/carrier_id
        i_connectionnumber TYPE /dmo/connection_id
      RAISING
        lcx_no_connection.


  PRIVATE SECTION.

    DATA : airlineid        TYPE /dmo/carrier_id,
           connectionnumber TYPE /dmo/connection_id,
           fromAirport      TYPE /dmo/airport_from_id,
           toAirport        TYPE /dmo/airport_to_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.

    DATA fromAirport      TYPE /dmo/airport_from_id.
    DATA toAirport        TYPE /dmo/airport_to_id.

     SELECT SINGLE FROM /dmo/connection
           FIELDS airport_from_id, airport_to_id
           WHERE carrier_id = @airlineid
           AND connection_id = @connectionnumber
           INTO ( @fromAirport, @toairport ).

     IF sy-subrc <> 0.
         RAISE EXCEPTION TYPE lcx_no_connection
          EXPORTING airlineid = i_airlineid
                    connectionnumber = i_connectionnumber.
     ELSE.
          me->connectionnumber = connectionnumber.
          me->fromairport = fromairport.
          me->toairport = toairport.
     ENDIF.

  ENDMETHOD.

ENDCLASS.
