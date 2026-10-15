# Bài 1: Quy trình CI đa phiên bản JDK (Matrix Strategy) cho Java Spring Boot Gradle

## 1. Giới thiệu sơ lược
Dự án thiết lập quy trình GitHub Actions CI ma trận (`strategy.matrix`) kiểm thử tự động ứng dụng Java Spring Boot trên cả hai phiên bản JDK phổ biến (JDK 17 và JDK 21).

## 2. Tính năng và cấu hình nổi bật
- **Kích hoạt tự động**: Chạy khi có sự kiện `push` lên nhánh `main`.
- **Matrix Strategy**: Rẽ nhánh chạy song song 2 sub-jobs:
  - `test-matrix (17)`: Chạy bài kiểm thử trên JDK 17.
  - `test-matrix (21)`: Chạy bài kiểm thử trên JDK 21.
- **Gradle Dependency Caching**: Cấu hình `cache: 'gradle'` trong `actions/setup-java` giúp tối ưu thời gian tải thư viện và tăng tốc độ CI.
- **GitHub Actions tương thích**: Sử dụng `actions/checkout@v5` và `actions/setup-java@v5` với phân phối `temurin`.

## 3. Cấu trúc thư mục
```text
homework/session_12/ex1/
├── .github/
│   └── workflows/
│       └── ci-matrix.yml       # File cấu hình workflow GitHub Actions
├── build.gradle                # Cấu hình Gradle dự án Spring Boot
├── settings.gradle             # Settings Gradle
├── gradlew                     # Gradle Wrapper script thực thi
├── run_tests_local.sh          # Script Shell chạy thử nghiệm ma trận cục bộ
├── src/                        # Mã nguồn ứng dụng và bài kiểm thử mẫu
└── README.md                   # Tài liệu hướng dẫn
```

## 4. Hướng dẫn chạy thử nghiệm

### Chạy thử nghiệm cục bộ với Shell Script:
```bash
cd homework/session_12/ex1
chmod +x run_tests_local.sh gradlew
./run_tests_local.sh
```

### Kiểm tra trên GitHub Actions:
1. Đẩy code lên repository GitHub nhánh `main`.
2. Mở tab **Actions** trên GitHub.
3. Xác nhận workflow `Java Spring Boot CI Matrix` tự động tạo ra 2 sub-jobs: `Test on Java 17` và `Test on Java 21` chạy song song và đều đạt trạng thái thành công (tích xanh).


## Ảnh chụp màn hình kết quả thực nghiệm
![Kết quả thực nghiệm](redis_cli_result.png)
