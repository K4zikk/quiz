<html>
<head?>
    <meta charset="UTF-8">
    <title>zadania phap</title>
    <link rel="stylesheet" href="style.css">
    
    </head?>
<body>
    <header>
    <div><h1>MEGA QUIZ TURNAMENT</h1></div>
    </header>
<?php
   $con = new mysqli("127.0.0.1", "root", "", "mydb");
    $res = $con ->query("SELECT id, question FROM questions");
    $rows = $res -> fetch_array();
      ?>



</body>
    </html>