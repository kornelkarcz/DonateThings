package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.Institution;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {
}
