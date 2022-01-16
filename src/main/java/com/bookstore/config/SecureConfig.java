package com.bookstore.config;

import com.bookstore.entities.Admin;
import com.bookstore.model.dto.AdminDto;
import com.bookstore.repositories.AdminRepositories;
import com.bookstore.service.AdminServices;
import com.bookstore.service.impl.EmployeeDetailsService;
import com.bookstore.service.impl.EmployeeLoginHandler;
import com.bookstore.service.impl.EmployeeLogoutSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Configuration
@EnableWebSecurity //sẽ kích hoạt việc tích hợp Spring Security với Spring MVC.
public class SecureConfig extends WebSecurityConfigurerAdapter {

    /**
     * thực hiện tham chiếu tới bean "userDetailsService" trong Spring Container.
     */
    @Autowired
    private EmployeeDetailsService employeeDetailsService;

    @Bean
    public EmployeeLogoutSuccessHandler logoutSuccessHandler() {
        return new EmployeeLogoutSuccessHandler();
    }
    @Autowired
    AdminServices adminServices;
    @Autowired
    AdminRepositories adminRepositories;
    @Autowired
    private EmployeeLoginHandler loginSuccessHandler;
    /**
     * đây là nơi thực hiện cấu hình bảo mật cho website.
     */
    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        // Cấu hình remember me, thời gian là 1296000 giây
       // http.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(240);

        // Cấu hình concurrent session
        /*http.sessionManagement().sessionFixation().newSession()
                .invalidSessionUrl("/login?message=timeout")//invalidSessionUrl() dùng để chỉ định url sẽ chuyển hướng tới nếu request chứa session đã hết hạn
                .maximumSessions(1)
                .expiredUrl("/login?message=max_session")//expiredUrl(): chỉ định đường dẫn sẽ chuyển hướng trong trường hợp login thất bại do tình huống bị timeout do login ở nơi khác.
                .maxSessionsPreventsLogin(true);*/
        /* maxSessionsPreventsLogin(): -xác định số lượng session lớn nhất có thể hoạt động đồng thời, ở đây mình để là 1 tức là 1 tài khoản chỉ cho phép hoạt động tại một nơi duy nhất.
        - nếu tham số đầu vào là true thì không thể login ở nơi khác khi đã đạt max session, nếu bằng false thì cho phép login ở nơi khác còn nơi login trước đó sẽ bị hết hạn.
        */
        http.csrf() //CSRF ( Cross Site Request Forgery) là kĩ thuật tấn công bằng cách sử dụng quyền chứng thực của người sử dụng đối với 1 website khác
                .disable()
                //antMatchers(): khai báo đường dẫn của request
                /*permitAll(): cho phép tất cả các user đều được phép truy cập.
                hasRole(roleName): chỉ cho phép các user có GrantedAuthority là ROLE_roleName mới được phép truy cập*/
                .authorizeRequests()// thực hiện xác thực request ngưười dùng gửi lên.
                .antMatchers( "/css/**", "/js/**", "/img/**", "/font/**", "/assets/**").permitAll() // Cho phép tất cả mọi người truy cập vào 2 địa chỉ này
                //.anyRequest().authenticated()
                .antMatchers("/admin/**").access("hasAnyAuthority('ADMIN', 'EMPLOYEE')")
                .antMatchers("/Admin/login").permitAll()
            .and() // kết hợp với điều kiện.
                // khi click vào button logout thì không cần login.
                // khi click vào button này thì dữ liệu user trên session sẽ bị xoá.
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessHandler(logoutSuccessHandler())
              //  .logoutSuccessUrl("/login")
                .invalidateHttpSession(true) // xoá hết dữ liệu trên seesion
                .deleteCookies("JSESSIONID") // xoá hết dữ liệu trên cokies.
                .permitAll()
            .and()
                .formLogin()
                .loginPage("/Admin/login") //đường dẫn tới trang chứa form đăng nhập
                //.defaultSuccessUrl("/admin?message=success", true)//đường dẫn tới trang đăng nhập thành công
               // .failureUrl("/login?message=fail")// đường dẫn tới trang đăng nhập thất bại
                .loginProcessingUrl("/Admin/login")// link action for form post.
                //.usernameParameter("username")
                .successHandler(loginSuccessHandler)
            .and()
                .exceptionHandling()
                .accessDeniedPage("/404");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(10);
    }

    /**
     * hàm này thực hiện kết nối giữa 2 Beans(AuthenticationManager và UserDetailsService).
     * Lí do phải kết nối 2 Beans này vì cần cho AuthenticationManager biết nơi để
     * xác thực và lấy quyền của người dùng.
     *
     * @param auth thực ra khi dùng @Autowired thì auth là bean được spring quản lí và add tham chiếu tới.
     * @throws Exception
     */
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        // thực hiện gắn kết AuthenticationManager với UserDetailsService.
        auth.userDetailsService(employeeDetailsService).passwordEncoder(passwordEncoder());
    }
    /**
     * định nghĩa lớp quản lí "Xác Thực" người dùng.
     *
     * @return
     * @throws Exception
     */
}
