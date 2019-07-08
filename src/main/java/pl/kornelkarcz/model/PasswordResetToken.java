package pl.kornelkarcz.model;

import java.sql.Timestamp;
import java.util.UUID;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Date;

@Entity
@Table
@RequiredArgsConstructor
@Data
public class PasswordResetToken {

    private static final int EXPIRATION = 60;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String token;

    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

    private Date createdDate;
    private Date expiryDate;

    private Date calculateExpiryDate(int expiryTimeInMinutes) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, expiryTimeInMinutes);
        return new Date(cal.getTime().getTime());

    }

    public boolean isExpired() {
        return new Date().after(this.expiryDate);
    }

    public PasswordResetToken(final User user) {
        super();
        Calendar calendar = Calendar.getInstance();
        this.user = user;
        this.createdDate = new Date(calendar.getTime().getTime());
        this.expiryDate = calculateExpiryDate(EXPIRATION);
        this.token = UUID.randomUUID().toString();
    }

    public PasswordResetToken(final String token, final User user) {
        super();
        Calendar calendar = Calendar.getInstance();

        this.token = token;
        this.user = user;
        this.createdDate = new Date(calendar.getTime().getTime());
        this.expiryDate = calculateExpiryDate(EXPIRATION);
    }
}
