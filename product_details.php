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
if (isset($_POST['submit'])) {
    $sql = "INSERT INTO product_details (price, quantity, img, descri, details) VALUES (?, ?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);

    $stmt->bind_param("iisss", $price, $quantity, $img, $describe, $details);

    $price = $_POST['pri'];
    $quantity = $_POST['quan'];
    $img = $_POST['img'];
    $describe = $_POST['desc']; 
    $details = $_POST['deta'];
    $stmt->execute();
    echo "Thêm thành công!";

    $stmt->close();
}   
$conn->close();
?>
<body>
    <form action="" method="post">
        <label for="">price</label>
        <input type="number" name="pri" required> <br> <br>

        <label for="">quantity</label>
        <input type="number" name="quan" required> <br> <br>

        <label for="">img</label>
        <input type="text" name="img" required> <br> <br>

        <label for="">describe</label>
        <input type="text" name="desc" required> <br> <br>

        <label for="">details</label>
        <input type="text" name="deta" required> <br> <br>

        <input type="submit" name="submit"> 
    </form>
</body>
</html>