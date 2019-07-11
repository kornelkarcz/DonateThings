package pl.kornelkarcz.service;

import lombok.Data;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.model.Address;
import pl.kornelkarcz.repository.AddressRepository;

import java.util.List;
import java.util.Optional;

@Service
@Data
public class AddressService {

    private final AddressRepository addressRepository;

    public List<Address> findAll() {
        return addressRepository.findAll();
    }

    public Optional<Address> findyById(Long id) {
        return addressRepository.findById(id);
    }

    public void save(Address address) {
        addressRepository.save(address);
    }

    public void delete(Address address) {
        addressRepository.delete(address);
    }
}
