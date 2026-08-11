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

    TYPES: BEGIN OF ts_instance,                                               " Das neu bei Singleton Pattern
           airlineid TYPE /dmo/carrier_id,
           connectionnumber TYPE /dmo/connection_id,
           object    TYPE REF TO lcl_connection,
           END OF ts_instance,

           tt_instance TYPE HASHED TABLE OF ts_instance
                       WITH UNIQUE KEY airlineid connectionnumber.

    DATA : airlineid        TYPE /dmo/carrier_id,
           connectionnumber TYPE /dmo/connection_id,
           fromAirport      TYPE /dmo/airport_from_id,
           toAirport        TYPE /dmo/airport_to_id.

           CLASS-DATA connections TYPE tt_instance.

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

    IF NOT line_exists( connections[ airlineid = airlineid connectionnumber = connectionnumber ] ).   " Abfrage Singleton

    SELECT SINGLE FROM /dmo/connection
           FIELDS airport_from_id, airport_to_id
           WHERE carrier_id = @airlineid
           AND connection_id = @connectionnumber
           INTO ( @fromAirport, @toairport ).

           ro_connection = NEW #( airlineid = airlineid
                                  connectionnumber = connectionnumber
                                  fromairport = fromairport
                                  toairport = toairport ).

     DATA(new_instance) = VALUE ts_instance( airlineid = airlineid
                                             connectionnumber = connectionnumber
                                             object = ro_connection ).

     INSERT new_instance INTO TABLE connections.

     ELSE.
       ro_connection = connections[ airlineid = airlineid
                                    connectionnumber = connectionnumber ]-object.

     ENDIF.

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
