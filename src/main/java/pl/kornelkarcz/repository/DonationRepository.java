package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.Donation;

public interface DonationRepository extends JpaRepository<Donation, Long> {
}
