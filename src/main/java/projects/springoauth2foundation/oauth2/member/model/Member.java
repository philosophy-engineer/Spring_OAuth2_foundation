package projects.springoauth2foundation.oauth2.member.model;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import projects.springoauth2foundation.oauth2.service.OAuth2Provider;

import java.util.Date;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@RequiredArgsConstructor
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) @Column(name = "member_id")
    private Long id;
    @Column(name = "id_from_oauth2_provider")
    private String idFromOAuth2Provider;
    @Enumerated(EnumType.STRING) @Column(name = "oauth2_provider")
    private OAuth2Provider oAuth2Provider;
    private String name;
    private Boolean isMale;
    private int age;
    @Temporal(TemporalType.DATE)
    private Date birthday;
    private String email;

    /**
     * 생성자
     */
    private Member(String idFromOAuth2Provider, OAuth2Provider oAuth2Provider, String name, Boolean isMale, int age, Date birthday, String email) {
        this.idFromOAuth2Provider = idFromOAuth2Provider;
        this.oAuth2Provider = oAuth2Provider;
        this.name = name;
        this.isMale = isMale;
        this.age = age;
        this.birthday = birthday;
        this.email = email;
    }

    /**
     * 생성 메소드
     */
    public static Member initMember(String idFromOAuth2Provider, OAuth2Provider oAuth2Provider, String name, Boolean isMale, int age, Date birthday, String email) {
        return new Member(idFromOAuth2Provider, oAuth2Provider, name, isMale, age, birthday, email);
    }
}
