package projects.springoauth2foundation.oauth2.service;

import org.springframework.security.oauth2.core.user.OAuth2User;
import projects.springoauth2foundation.oauth2.member.model.Member;

public interface OAuth2MemberServiceByOAuth2Provider {

    OAuth2Provider oAuth2Provider();

    Member parse(OAuth2User oAuth2User);

}
