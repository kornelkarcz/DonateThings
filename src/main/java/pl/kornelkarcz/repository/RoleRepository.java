package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.kornelkarcz.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);

}
