package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.kornelkarcz.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "select * from donations where user_id = :userId order by id desc limit 1", nativeQuery = true)
    Donation findByUserIdLastDonation(@Param("userId") Long userId);

    @Query(value = "select count(distinct institution_id) from donations", nativeQuery = true)
    Long countDistinctByInstitution();

    @Query(value = "select * from donations where user_id = :userId", nativeQuery = true)
    List<Donation> getUserAllDonations(@Param("userId") Long userId);

}

