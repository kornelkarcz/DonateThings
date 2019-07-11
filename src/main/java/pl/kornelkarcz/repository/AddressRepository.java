package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long> {
}
