<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
    <?php
        $conn = new mysqli('localhost', 'root', '30042004', 'project1');

        if ($conn)
        {
            if (isset($_POST['register']))
            {
                $sql = "INSERT INTO user (role_id, full_name, username, password, email, gender, phone_number, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param("isssssis", $role, $name, $user, $pass, $mail, $gender, $phone, $address);
                $role = 2;
                $name = $_POST['fname'];
                $user = $_POST['user'];
                $pass = $_POST['pass'];
                $mail = $_POST['mail'];
                $gender = $_POST['gender'];
                $phone = $_POST['phone'];
                $address = $_POST['address'];
                $stmt->execute();
                $stmt->close();
            }
        }
        else
        {
            die("Kết nối thất bại.");
        }
        $conn->close();
    ?>

    <form method="post" action="">
        <h1>Register</h1>

        Họ và tên:<br>
        <input type="text" name="fname" required/>
        <br><br>

        Tên đăng nhập:<br>
        <input type="text" name="user" required/>
        <br><br>

        Mật khẩu:<br>
        <input type="password" name="pass" required/>
        <br><br>

        Email:<br>
        <input type="email" name="mail" required/>
        <br><br>

        Giới tính:
        <select name="gender" style="margin-bottom: 15px;">
            <option>Khác</option>
            <option>Nam</option>
            <option>Nữ</option>
        </select>
        <br><br>

        Số điện thoại:<br>
        <input type="number" name="phone" required/>
        <br><br>

        Địa chỉ:<br>
        <input type="text" name="address" required>
        <br><br>

        <input type="submit" name="register" value="Đăng Ký">
        <br><br>
    </form>
</body>
</html>