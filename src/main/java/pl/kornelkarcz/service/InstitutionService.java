package pl.kornelkarcz.service;

import lombok.Data;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.repository.InstitutionRepository;

import java.util.List;
import java.util.Optional;

@Service
@Data
public class InstitutionService {

    private final InstitutionRepository institutionRepository;

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public Optional<Institution> findById(Long id) {
        return institutionRepository.findById(id);
    }

    public void save(Institution institution) {
        institutionRepository.save(institution);
    }

    public void delete(Institution institution) {
        institutionRepository.delete(institution);
    }

}
