package ph.com.qkc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ph.com.qkc.model.User;

public interface UserAuthRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
