<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
// kiểm tra nút đăng nhập được bấm hay không
if(isset($_POST['login'])){
    // lấy thông tin tài khoản và mật khẩu từ form đăng nhập
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // kết nối đến cơ sở dữ liệu
    $conn = mysqli_connect("localhost", "root", "123456789", "test");
    
    // kiểm tra kết nối có thành công hay không
    if(!$conn){
        die("Kết nối thất bại: " . mysqli_connect_error());
    }
    
    // chuẩn bị truy vấn để kiểm tra tài khoản và mật khẩu
    $sql = "SELECT * FROM user WHERE username = '$username'";
    
    // thực thi truy vấn
    $result = mysqli_query($conn, $sql);
    
    // kiểm tra xem tài khoản có tồn tại hay không
    if(mysqli_num_rows($result) == 1){
        // lấy thông tin người dùng từ cơ sở dữ liệu
        $row = mysqli_fetch_assoc($result);
        $hashed_password = password_hash($row['password'],PASSWORD_DEFAULT);
        
        // kiểm tra mật khẩu
        if(password_verify($password, $hashed_password)){
            // đăng nhập thành công
            session_start();
            $_SESSION['username'] = $username;
            header("Location: dashboard.php");
        } else {
            // đăng nhập không thành công
            $error = "Mật khẩu không đúng";
        }
    } else {
        // tài khoản không tồn tại
        $error = "Tài khoản không tồn tại";
    }
    
    // đóng kết nối
    mysqli_close($conn);
}
?>

<!-- hiển thị form đăng nhập -->
<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
    <label for="username">Tên đăng nhập:</label><br>
    <input type="text" id="username" name="username"><br>
    <label for="password">Mật khẩu:</label><br>
    <input type="password" id="password" name="password"><br><br>
    <input type="submit" name="login" value="Đăng nhập">
</form>

<!-- hiển thị thông báo lỗi (nếu có) -->
<?php if(isset($error)){ echo $error; } ?>
</body>
</html>