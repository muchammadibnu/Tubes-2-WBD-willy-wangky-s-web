<!DOCTYPE html>
<?php
    if (!isset($_COOKIE['login_string'])){
        echo "<script type='text/javascript'>alert('You have to login first');</script>";
        echo "<script type='text/javascript'>document.location.href='login.php';</script>"; 
    }
    require_once("connection.php");
    $login_string = md5($_COOKIE['login_string']);
    $sql = "SELECT * FROM cookie_data WHERE login_string = '$login_string'";
    $result = $conn->query($sql);
    if ($result->num_rows == 0){
        echo "<script type='text/javascript'>alert('You have to login first');</script>";
        echo "<script type='text/javascript'>document.location.href='login.php';</script>"; 
    }
    else{
        $row = $result -> fetch_assoc();
        $username = $row["username"];
        $sql = "SELECT role FROM user WHERE username = '$username'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0){
            $row = $result -> fetch_assoc();
            if($row["role"]!="admin"){
                echo "<script type='text/javascript'>alert('User restricted');</script>";
                echo "<script type='text/javascript'>document.location.href='index.php';</script>"; 
            }
        }
        else{
            echo "<script type='text/javascript'>alert('Server goes wrong');</script>";
            echo "<script type='text/javascript'>document.location.reload();</script>"; 
        }
    }
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' media='screen' href='css/ChocolateAddNewPage.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/styles.css'>
    <title>Chocolate Add New</title>
</head>
<body>
    <!--- Navigation Bar --->
    <nav>
        <a href="#">Home</a>
        <a href="#">History</a>
        <div class="search">
            <form action="">
                <input type="search" placeholder="Search" required>
            </form>
        </div>
        <a href="#">Log out</a>
    </nav>

    <div class="container">
        <h1>Add new chocolate page</h1>
      
        <div class="card">
            <h2>List Material from supplier</h2>
            
            <div id="listMaterial"></div><br>
        </div>
        <br><br>
        
        <div class="card">
            <h2>Input Recipe</h2>
            <br>
            <form id="formResep" action="action_AddNewChocolate.php" method="POST" enctype="multipart/form-data">
                <input type="text" id="name" name="name" placeholder="Chocolate Name">
                <input type="text" id="price" name="price" placeholder="Price">
                <input type="text" id="description" name="description" placeholder="Description">
                <input type="text" id="listBahan" name="listBahan" placeholder="List Bahan (bahan1,bahan2,bahan3,...)">
                <input type="text" id="listJumlahBahan" name="listJumlahBahan" placeholder="List Jumlah Masing Masing Bahan (12,14,5,...)">
                <input type="file" name="chocolateImg" id="chocolateImg" placeholder="image">
                <br><br>
                <button type="submit">Add New Chocolate</button>
                
            </form>
        </div>
        <br><br>

        <div class="card">
            <h2>List Recipe</h2>
            <div id="listRecipe"></div><br>
        </div>
        <br><br>

</div>
<script src="scripts/scriptAddNewChocolate.js"> </script>
</body>
</html>