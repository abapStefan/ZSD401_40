*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS super1 DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS class_constructor.

    METHODS: constructor IMPORTING i_a TYPE i.

    CLASS-DATA table TYPE TABLE OF string.

    DATA: m_a TYPE i.

ENDCLASS.

CLASS super1 IMPLEMENTATION.

  METHOD class_constructor.
    DATA text TYPE string VALUE '1 Classconstructor der Oberklasse aufgerufen '.
    APPEND text TO table.
  ENDMETHOD.

  METHOD constructor.
    DATA text TYPE string VALUE '4 Instanz Constructor der Oberklasse aufgerufen'.   " Dies wird beim erstellen eines Objektes ausgeköst.
    APPEND text TO table.
  ENDMETHOD.

ENDCLASS.

CLASS sub1 DEFINITION INHERITING FROM super1.
  PUBLIC SECTION.

    CLASS-METHODS class_constructor.
    METHODS: constructor.

ENDCLASS.

CLASS sub1 IMPLEMENTATION.

  METHOD class_constructor.
    DATA text TYPE string VALUE '2 Classconstructor der Unterklasse aufgerufen'.       "Dies wird ausgelöst beim ersten Zugriff auf die Klasse
    APPEND text TO table.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( i_a = m_a ).
    DATA text TYPE string VALUE '3 danach 5 Instanz constructor der Unterklasse aufgeufen'.
    APPEND text TO table.
  ENDMETHOD.

ENDCLASS.

