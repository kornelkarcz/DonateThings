package pl.kornelkarcz.model;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Data
@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private Long id;

    @Column(name = "first_name")
    @NotEmpty(message = "Please provide a first name")
    private String firstName;

    @Column(name = "last_name")
    @NotEmpty(message = "Please provide a last name")
    private String lastName;

    @Column(name = "email")
    @Email(message = "Please provide valid email")
    @NotEmpty(message = "Please provide email")
    private String email;

    @Column(name = "password")
    @NotEmpty
    @Length(min = 5, message = "Your password must be at least 5 characters long")
    private String password;

    @Column(name = "active")
    private int active;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
}
