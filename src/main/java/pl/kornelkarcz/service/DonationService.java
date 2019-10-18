package pl.kornelkarcz.service;

import lombok.Data;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.model.Donation;
import pl.kornelkarcz.repository.DonationRepository;

import java.util.List;
import java.util.Optional;

@Data
@Service
public class DonationService {

    private final DonationRepository donationRepository;

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    public Optional<Donation> findById(Long id) {
        return donationRepository.findById(id);
    }

    public void save(Donation donation) {
        donationRepository.save(donation);
    }

    public Long countDistinctByInstitution() {
        return donationRepository.countDistinctByInstitution();
    }

    public List<Donation> getUserAllDonations(Long id) {
        return donationRepository.getUserAllDonations(id);
    }

    public void delete(Long id) {
        donationRepository.deleteById(id);
    }

//    public Donation findLastDonation() {
//        return donationRepository.findFirstByOrOrderByDonationId();
//    }
}
