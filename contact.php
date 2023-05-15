<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<?php
$conn = new mysqli('localhost', 'root', '12345678', 'project1');

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

if (isset($_POST['run']))
{

    $sql = "INSERT INTO product_details (price, quantity, img, describe, details, star, number_rated) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($sql);
    
    $stmt->bind_param("sssssss", $price, $quantity, $img, $describe, $details, $star, $number_rated);
    
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $img = $_POST['img'];
    $describe = $_POST['describe'];
    $details = $_POST['details'];
    $star = $_POST['star'];
    $number_rated = ['number_rated'];  
    $stmt->execute();
    
    echo "Thêm thành công!";
    
    $stmt->close();
}
$conn->close();
?>
<body>
    <p>fvhhfdvfj
        
    </p>
</body>
</html>