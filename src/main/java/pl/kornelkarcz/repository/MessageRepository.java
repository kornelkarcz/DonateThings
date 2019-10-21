package pl.kornelkarcz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.kornelkarcz.model.Message;

public interface MessageRepository extends JpaRepository<Message, Long> {
}
