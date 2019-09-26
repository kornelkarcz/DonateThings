package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.kornelkarcz.model.Donation;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "select * from donations where user_id = :userId order by id desc limit 1", nativeQuery = true)
    Donation findByUserIdLastDonation(@Param("userId") Long userId);

}

