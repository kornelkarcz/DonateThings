package pl.kornelkarcz.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final SpringDataUserDetailsService springDataUserDetailsService;
    private final DataSource dataSource;

//    private  final CustomAuthenticationFailureHandler authenticationFailureHandler;


    public SecurityConfig(SpringDataUserDetailsService springDataUserDetailsService,
                          DataSource dataSource) {
        this.springDataUserDetailsService = springDataUserDetailsService;
        this.dataSource = dataSource;
//        this.authenticationFailureHandler = authenticationFailureHandler;
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(springDataUserDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/", "/login", "/perform_login", "/logout", "/perform_logout", "/register")
                .permitAll();

        http.authorizeRequests()
                .antMatchers("/user_info", "/userDetails", "/profile/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

        http.authorizeRequests()
                .antMatchers("/admin").access("hasRole('ROLE_ADMIN')");

        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

        http.authorizeRequests().and()
                .formLogin()
                .loginProcessingUrl("/perform_login")
                .loginPage("/login")
                .defaultSuccessUrl("/loginSuccess")
                .failureUrl("/login?error=true")
                .usernameParameter("email")
                .passwordParameter("password")
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/logout_success");

        http.authorizeRequests()
                .antMatchers("/console/**")
                .permitAll();

        http.csrf().disable();
        http.headers().frameOptions().disable();
    }

}
