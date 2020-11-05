package com.dimsirka.animalservice.repositories;

import com.dimsirka.animalservice.entities.Admin;
import com.dimsirka.animalservice.entities.Token;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.transaction.Transactional;
import java.util.Optional;

public interface TokenRepository extends JpaRepository<Token, Long> {
    Optional<Token> findTokenByToken(String token);

    @Transactional
    void deleteTokenByAdmin(Admin admin);
}
