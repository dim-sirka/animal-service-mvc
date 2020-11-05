package com.dimsirka.animalservice.security;

import com.dimsirka.animalservice.entities.Token;
import com.dimsirka.animalservice.repositories.TokenRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.time.Duration;
import java.util.Date;


@Component
@Slf4j
public class TokenProvider implements AuthenticationProvider {

    private TokenRepository tokenRepository;

    @Autowired
    public TokenProvider(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    @Override
    public Authentication authenticate(Authentication authentication){
        TokenAuthentication tokenAuthentication = (TokenAuthentication) authentication;

        return tokenRepository.findTokenByToken(tokenAuthentication.getToken())
                        .filter(this::isValidToken)
                        .map(token->{
                            tokenAuthentication.setUserDetails(token.getAdmin());
                            tokenAuthentication.setAuthenticated(true);
                            log.info("Admin <{}> was authenticated!", token.getAdmin().getEmail());
                            return tokenAuthentication;
                        })
                        .orElse(null);
    }

    @Override
    public boolean supports(Class<?> authenticationClass) {
        return TokenAuthentication.class.equals(authenticationClass);
    }

    private boolean isValidToken(Token token) {
        Timestamp tokenCreatedTimestamp = token.getCreatedDate();
        Timestamp currentTimestamp = new Timestamp(new Date().getTime());

        Duration duration = Duration.between(tokenCreatedTimestamp.toInstant(), currentTimestamp.toInstant());
        long diffHours = Math.abs(duration.toHours());
        return diffHours <= 1;
    }
}
