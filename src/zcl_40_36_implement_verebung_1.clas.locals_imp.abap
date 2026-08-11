*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_fahrzeuge definition.

  public section.

    TYPES: BEGIN OF fs_attribute,                                 " Lokale Struktur erstellt
            name TYPE string,
            value TYPE string,
           END OF fs_attribute.

     TYPES ft_attribute TYPE SORTED TABLE OF fs_attribute         " Lokale ITAB erstellt
                        WITH UNIQUE Key name.

     METHODS constructor                                          " Constructor Methode erstellen
          importing i_hersteller TYPE string
                    i_typ        TYPE string.

     METHODS get_attributes RETURNING VALUE(rt_attribute) TYPE ft_attribute.

  protected section.
  private section.

     DATA hersteller TYPE string.
     DATA typ        TYPE string.

endclass.

class lcl_fahrzeuge implementation.

  method constructor.

       hersteller = i_hersteller.
       typ        = i_typ.

  endmethod.

  method get_attributes.

        rt_attribute = value #( ( name = 'Hersteller'  value = hersteller )
                                ( name = 'Typ'         value = typ ) ).

  endmethod.

endclass.
