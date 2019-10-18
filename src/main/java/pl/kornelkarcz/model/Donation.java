package pl.kornelkarcz.model;

import lombok.Data;
import org.springframework.format.annotation.NumberFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
@Entity
@Table(name = "donations")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

//    @NotEmpty(message = "Number of bags cannot be empty")
    private Integer numberOfBags;

    @NotEmpty(message = "Please provide brief description of the content")
    private String contentDescription;

    @NotEmpty(message = "Phone number cannot be empty")
    private String phoneNumber;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "institution_id", referencedColumnName = "id")
    private Institution institution;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @NotEmpty(message = "Street name cannot be empty")
    private String streetName;

    @NumberFormat
    private Integer houseNumber;
    @NumberFormat
    private Integer flatNumber;

    @NotEmpty(message = "City cannot be empty")
    private String city;

    @NotEmpty(message = "Postal code cannot be empty")
    @Pattern(regexp = "\\d{2}-\\d{3}", message = "Postal code should match with pattern XX-XXX")
    private String postalCode;

    private String comment;

}
