package pl.kornelkarcz.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotEmpty(message = "Street name cannot be empty")
    private String street;

    @NotEmpty(message = "House number cannot be empty")
    private int houseNumber;
    private int flatNumber;

    @NotEmpty(message = "City cannot be empty")
    private String city;

    @NotEmpty(message = "Postal code cannot be empty")
    @Pattern(regexp = "\\d{2}-\\d{3}", message = "Postal code should match with pattern XX-XXX")
    private String postalCode;
}
