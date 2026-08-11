*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION CREATE PRIVATE.       " Wichtig CREATE Privat
                                                      " Kein NEW # ausserhalb der klasse

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        airlineid        TYPE /dmo/carrier_id
        connectionnumber TYPE /dmo/connection_id
        fromAirport      TYPE /dmo/airport_from_id
        toAirport        TYPE /dmo/airport_to_id.

    METHODS get_attributes RETURNING VALUE(rt_result) TYPE string_table.

    CLASS-METHODS get_connection                                              " Statische Factory Methode
      IMPORTING airlineid            TYPE /dmo/carrier_id
                connectionnumber     TYPE /dmo/connection_id
      RETURNING VALUE(ro_connection) TYPE REF TO lcl_connection.

    CLASS-METHODS get_n_o_connections RETURNING VALUE(rv_count) TYPE i.

    CLASS-DATA gv_n_o_connections TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA : airlineid        TYPE /dmo/carrier_id,
           connectionnumber TYPE /dmo/connection_id,
           fromAirport      TYPE /dmo/airport_from_id,
           toAirport        TYPE /dmo/airport_to_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.
    me->airlineid = airlineid.
    me->connectionnumber = connectionnumber.
    me->fromairport = fromairport.
    me->toairport = toairport.

    gv_n_o_connections = gv_n_o_connections + 1.

  ENDMETHOD.

  METHOD get_connection.

    DATA fromAirport      TYPE /dmo/airport_from_id.
    DATA toAirport        TYPE /dmo/airport_to_id.

    SELECT SINGLE FROM /dmo/connection
           FIELDS airport_from_id, airport_to_id
           WHERE carrier_id = @airlineid
           AND connection_id = @connectionnumber
           INTO ( @fromAirport, @toairport ).

           ro_connection = NEW #( airlineid = airlineid
                                  connectionnumber = connectionnumber
                                  fromairport = fromairport
                                  toairport = toairport ).

  ENDMETHOD.

  METHOD get_n_o_connections.

   rv_count = gv_n_o_connections.

  ENDMETHOD.

  METHOD get_attributes.

       APPEND |Fluggesellschaft: { me->airlineid }       | TO rt_result.
       APPEND |Carrid: { me->connectionnumber }          | TO rt_result.
       APPEND |Abfluhafen: { me->airlineid }             | TO rt_result.
       APPEND |Zielflugahfen: { me->airlineid }          | TO rt_result.
       APPEND |------------------------------------------| TO rt_result.

  ENDMETHOD.

ENDCLASS.
