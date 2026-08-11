*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_vehicle definition.

  public section.

     DATA a VALUE 'a'.
     DATA b VALUE 'b'.
     DATA c VALUE 'c'.

     METHODS get_make.
     methods get_count.

  protected section.


  private section.

    DATA d VALUE 'd'.


endclass.

class lcl_vehicle implementation.

  method get_make.

   DATA test TYPE string VALUE 'get_make'.

  endmethod.

  method get_count.

   DATA test TYPE string VALUE 'get_count'.

  endmethod.

endclass.

class lcl_truck definition INHERITING FROM lcl_vehicle.    " LKW erbt alles aus der Oberklasse

 PUBLIC SECTION.

  DATA e VALUE 'e'.

  METHODS get_cargo.


 PRIVATE SECTION.

      DATA f VALUE 'f'.


endclass.

class lcl_truck implementation.

  METHOD get_cargo.

ENDMETHOD.

endclass.
