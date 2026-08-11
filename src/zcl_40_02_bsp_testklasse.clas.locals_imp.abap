*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_compute definition create public.

  public section.

     METHODS summe IMPORTING iv_zahl1 TYPE i
                             iv_zahl2 TYPE i
                   EXPORTING ev_result TYPE i.

  protected section.
  private section.

endclass.

class lcl_compute implementation.

  method summe.

   ev_result = iv_zahl1 + iv_zahl2 .

  endmethod.

endclass.
