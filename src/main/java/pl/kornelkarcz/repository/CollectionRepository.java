package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.kornelkarcz.model.Collection;

import java.util.List;

public interface CollectionRepository extends JpaRepository<Collection, Long> {

    @Query(value = "select * from collections where user_id = :userId order by id desc limit 1", nativeQuery = true)
    Collection findByUserIdLastCollection(@Param("userId") Long userId);

    @Query(value = "select count(distinct institution_id) from collections", nativeQuery = true)
    Long countDistinctByInstitution();

    @Query(value = "select * from collections where user_id = :userId", nativeQuery = true)
    List<Collection> getUserAllCollections(@Param("userId") Long userId);

    Collection getFirstByUser_Id(Long id);
}
