<?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        require_once('connection.php');
     
        $name = $_POST['name'];
        $description = $_POST['description'];
        $price = $_POST['price'];

        $fileName = $_FILES['chocolateImg']['name'];
        $fileSize = $_FILES['chocolateImg']['size'];
        $fileTmpName  = $_FILES['chocolateImg']['tmp_name'];
        $fileType = $_FILES['chocolateImg']['type'];
        
        $currentDirectory = getcwd();
        $uploadDirectory = "/";
        
        $uploadPath = $currentDirectory . $uploadDirectory . basename($fileName);
        $savedName = basename($fileName); 

        $sql = "INSERT INTO product (`name`, price, sold, amount, `Description`, photo) VALUES('$name','$price', 0, 0, '$description', '$savedName')";
        if ($conn->query($sql) === TRUE) {
            $conn->close();
            
            $didUpload = move_uploaded_file($fileTmpName, $uploadPath);
            if ( $didUpload){
                echo "success";
                header('Location: ChocolateAddNewPage.php');
            }
            else{
                echo "error when uploading " +$fileTmpName ;
            }
        } else {
            $conn->close();
            echo "Error updating record: " . $conn->error;
        }
    }
?>