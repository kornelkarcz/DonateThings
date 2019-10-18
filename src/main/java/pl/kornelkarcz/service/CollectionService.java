package pl.kornelkarcz.service;

import lombok.Data;
import org.springframework.stereotype.Service;
import pl.kornelkarcz.model.Collection;
import pl.kornelkarcz.repository.CollectionRepository;

import java.util.List;
import java.util.Optional;

@Service
@Data
public class CollectionService {

    private final CollectionRepository collectionRepository;

    public List<Collection> findAll() {
        return collectionRepository.findAll();
    }

    public Optional<Collection> findById(Long id) {
        return collectionRepository.findById(id);
    }

    public void save(Collection collection) {
        collectionRepository.save(collection);
    }

    public Collection findByUserIdLastCollection(Long id) {
        return collectionRepository.findByUserIdLastCollection(id);
    }

    public Long countDistinctByInstitution() {
        return collectionRepository.countDistinctByInstitution();
    }

    public List<Collection> getUserAllCollections(Long id) {
        return collectionRepository.getUserAllCollections(id);
    }

    public void delete(Long id) {
        collectionRepository.deleteById(id);
    }

    public Collection getFirstByUser_Id(Long id) {
        return collectionRepository.getFirstByUser_Id(id);
    }
}
