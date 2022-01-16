package com.bookstore;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication// Diem dau vao cua spring boot
/*
 * giúp bạn tự động cấu hình Spring, và tự động quét (Scan) toàn bộ project để
 * tìm ra các thành phần Spring (Controller, Bean, Service,...)
 */

/*
 * Interface CommandLineRunner này có một phương thức mà chúng ta phải
 * implement, đó là phương thức run(). Đây cũng chính là phương thức giúp chúng
 * ta có thể thực thi code dưới console.
 */
public class StartServer implements CommandLineRunner {

    @Value("${server.port}") private Integer port;
    public void run(String... args) throws Exception {//Interface CommandLineRunner sẽ dùng thực hiện hàm run này
        System.out.println("-------------------CODE EXECUTE---------------");
        System.out.println("--------------------- " + port);
    }
    public static void main(String[] args) {
        SpringApplication.run(StartServer.class, args);
    }
}
