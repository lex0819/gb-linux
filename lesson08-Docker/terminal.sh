➜  wordpress-docker cd wp03-test
➜  wp03-test ls -l
total 0
➜  wp03-test touch docker-compose.yml
➜  wp03-test mkdir -p nginx
➜  wp03-test mkdir -p db-data
➜  wp03-test mkdir -p logs
➜  wp03-test mkdir -p wordpress
➜  wp03-test ls -l
total 0
drwxr-xr-x@ 2 lex  staff  64 Jun 24 21:55 db-data
-rw-r--r--@ 1 lex  staff   0 Jun 24 21:54 docker-compose.yml
drwxr-xr-x@ 2 lex  staff  64 Jun 24 21:55 logs
drwxr-xr-x@ 2 lex  staff  64 Jun 24 21:55 nginx
drwxr-xr-x@ 2 lex  staff  64 Jun 24 21:56 wordpress
➜  wp03-test
➜  wp03-test
➜  wp03-test docker compose up -d
[+] Running 45/21
 ✔ nginx 7 layers [⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                            10.6s
 ✔ pma 18 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                   9.3s
 ✔ wordpress 17 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled             16.0s

[+] Building 0.0s (0/0)
[+] Running 3/2
 ✔ Network wp03-test_default                                                                                                                          Created0.1s  0.2s
 ✔ Container wp03-test-mysql-1                                                                                                                        Created0.2s
[+] Running 5/503-test-pma-1                                                         ✔ Network wp03-test_default                                                                                                                          Created0.1s        ⠿ Container wp03-test-mysql-1                                                                                                                        Starting0.4s  host ✔ Container wp03-test-pma-1                                                        [+] Running 5/6                                                   Created0.1s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ⠿ Container wp03-test-mysql-1                                                                                                                        Starting0.5s
 ✔ Container wp03-test-pma-1                                                        [+] Running 5/6                                                   Created0.1s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ⠿ Container wp03-test-mysql-1                                                                                                                        Starting0.6s
 ✔ Container wp03-test-pma-1                                                        [+] Running 4/6                                                   Created0.1s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ⠿ Container wp03-test-pma-1                                                        [+] Running 4/6                                                   Starting0.5s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ⠿ Container wp03-test-pma-1                                                        [+] Running 4/6                                                   Starting0.6s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ⠿ Container wp03-test-pma-1                                                        [+] Running 5/6                                                   Starting0.7s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ✔ Container wp03-test-pma-1                                                        [+] Running 5/6                                                   Started0.7s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ✔ Container wp03-test-pma-1                                                        [+] Running 5/6                                                   Started0.7s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ✔ Container wp03-test-pma-1                                                        [+] Running 6/6                                                   Started0.7s
 ✔ Network wp03-test_default                                                                                                                          Created0.1s
 ✔ Container wp03-test-mysql-1                                                                                                                        Started0.7s
 ✔ Container wp03-test-pma-1                                                                                                                          Started0.7s
 ✔ Container wp03-test-wordpress-1                                                                                                                    Started0.8s
 ! pma The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested 0.0s
 ✔ Container wp03-test-nginx-1                                                                                                                        Started0.9s
➜  wp03-test
➜  wp03-test docker compose down
[+] Running 5/5
 ✔ Container wp03-test-nginx-1      Removed                                    0.2s
 ✔ Container wp03-test-pma-1        Removed                                    1.3s
 ✔ Container wp03-test-wordpress-1  Remov...                                   0.1s
 ✔ Container wp03-test-mysql-1      Removed                                    0.5s
 ✔ Network wp03-test_default        Removed                                    0.0s
➜  wp03-test
➜  wp03-test
