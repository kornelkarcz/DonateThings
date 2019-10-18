package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.kornelkarcz.model.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {

//    @Query(value = "select d from Donation  d where d.user.id = ?1 order by d.id desc")
//    Donation findLastDonation(Long id);


    @Query(value = "select count(distinct institution_id) from donations", nativeQuery = true)
    Long countDistinctByInstitution();

    @Query(value = "select * from donations where user_id = :userId", nativeQuery = true)
    List<Donation> getUserAllDonations(@Param("userId") Long userId);


}

