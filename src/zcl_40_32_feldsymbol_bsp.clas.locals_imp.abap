*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_demo definition.

  public section.

  METHODS use_work_area.
  METHODS use_field_symbol.

  protected section.
  private section.

  Types tt_flights TYPE STANDARD TABLE OF /lrn/passflight
                   WITH non-UNIQUE Key carrier_id connection_id flight_date.

  Methods loop_field_symbol
     CHANGING
       c_flights TYPE tt_flights.

  Methods loop_work_area
     CHANGING
       c_flights TYPE tt_flights.

endclass.

class lcl_demo implementation.

    method use_field_symbol.

     DATA flights TYPE tt_flights.

     SELECT
       FROM /lrn/passflight
       FIELDS *
      INTO TABLE @flights.

     loop_field_symbol( changing c_flights = flights ).


    endmethod.

   method use_work_area.

    DATA flights TYPE tt_flights.

     SELECT
       FROM /lrn/passflight
       FIELDS *
      INTO TABLE @flights.

     loop_work_area( changing c_flights = flights ).

  endmethod.

  method loop_field_symbol.

    LOOP AT c_flights ASSIGNING FIELD-SYMBOL(<flight>).
    <flight>-seats_occupied = <flight>-seats_occupied + 1.
    ENDLOOP.

  endmethod.

  method loop_work_area.

    LOOP AT c_flights INTO DATA(flight).
    flight-seats_occupied = flight-seats_occupied + 1.
    ENDLOOP.

  endmethod.





endclass.
