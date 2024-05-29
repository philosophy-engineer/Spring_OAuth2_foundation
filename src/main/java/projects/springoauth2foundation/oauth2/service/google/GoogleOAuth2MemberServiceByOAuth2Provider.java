package projects.springoauth2foundation.oauth2.service.google;

import org.springframework.security.oauth2.core.user.OAuth2User;
import projects.springoauth2foundation.oauth2.member.model.Member;
import projects.springoauth2foundation.oauth2.service.OAuth2MemberServiceByOAuth2Provider;
import projects.springoauth2foundation.oauth2.service.OAuth2Provider;

public class GoogleOAuth2MemberServiceByOAuth2Provider implements OAuth2MemberServiceByOAuth2Provider {
    @Override
    public OAuth2Provider oAuth2Provider() {
        return OAuth2Provider.GOOGLE;
    }

    @Override
    public Member parse(OAuth2User oAuth2User) {
        return null;
    }
}
