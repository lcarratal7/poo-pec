// SPDX-FileCopyrightText: 2025 Lucas Carratalá Del Toro <lcarratal7@alumno.uned.es>
//
// SPDX-License-Identifier: EUPL-1.2

/**
 * Clase que rige a toda persona involucrada en el sistema, ya sea usuaria o
 * empleada.
 *
 * @author Lucas Carratalá Del Toro
 * @version 2025
 */
public abstract class Person {
  /**
   * Serves as a UID for all Persons. It MUST be unique, otherwise it would
   * result in an error when trying to add the person. It can't change once
   * defined.
   */
  private final String dni;

  /**
   * Given name of the person.
   */
  private String givenName;

  /**
   * Family names, could be more than a single one.
   */
  private String familyName;

  /**
   * Crea una nueva persona.
   *
   * @param dni        El DNI de la persona. Debe ser único, servirá como UID.
   * @param givenName  El nombre propio de la persona.
   * @param familyName Los apellidos de la persona.
   */
  public Person(String dni, String givenName, String familyName) {
    this.dni = dni;
    this.givenName = givenName;
    this.familyName = familyName;
  }

  // Getters and Setters.
  public String getDni() {
    return dni;
  }

  public String getGivenName() {
    return givenName;
  }

  public void setGivenName(String givenName) {
    this.givenName = givenName;
  }

  public String getFamilyName() {
    return familyName;
  }

  public void setFamilyName(String familyName) {
    this.familyName = familyName;
  }
}
