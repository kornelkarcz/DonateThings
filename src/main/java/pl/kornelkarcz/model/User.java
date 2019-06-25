package pl.kornelkarcz.model;

import lombok.Data;
import lombok.ToString;
import pl.kornelkarcz.validator.ValidPassword;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "user")
@ToString
public class User {

    @Id
    @GeneratedValue
    private Long id;
    private String email;
    private String firstName;
    private String lastName;
//    @ValidPassword
    private String password;
    private Boolean enabled;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roleSet = new HashSet<>();
}
