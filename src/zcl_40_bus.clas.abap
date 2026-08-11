CLASS zcl_40_bus DEFINITION
  PUBLIC
  INHERITING FROM zcl_40_vehicle
  FINAL
  CREATE PUBLIC .

 public section.

      METHODS constructor                                          " Neuer Constructor für Unterklasse Buss mit neuem Attribut
          importing i_hersteller TYPE string
                    i_typ        TYPE string
                    i_ps         TYPE i
                    i_sitze      TYPE i.

        METHODS  get_attributes  REDEFINITION.                " Methode Redefinieren


  protected section.
  private section.

     DATA sitze TYPE i.                                      " neues Attribut erstellt
ENDCLASS.



CLASS zcl_40_bus IMPLEMENTATION.

method constructor.

    super->constructor( i_hersteller = i_hersteller i_typ = i_typ i_ps = i_ps ).

    sitze = i_sitze.

  endmethod.

  method get_attributes.

* 2 Option: Die Neudefinition verwqendet den aufruf der Implementierung der Oberklasse

     rt_attribute = super->get_attributes( ).             " Aufruf der Oberklasse seine Komponenten

     rt_attribute = VALUE #( BASE rt_attribute
                           ( fahrzeugdaten = 'Sitzplätze' wert = sitze ) ).

  endmethod.



ENDCLASS.
