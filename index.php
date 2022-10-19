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
    $res = $con ->query("SELECT * FROM questions WHERE id=1");
    $rows = $res -> fetch_all(MYSQLI_ASSOC);
   for($i=0;$i<count($rows);$i++)
       echo $rows[$i]["question"]."<br>";
    $res = $con ->query("SELECT * FROM answers WHERE questions_id=1");
      $rows = $res -> fetch_all(MYSQLI_ASSOC);
       for($i=0;$i<count($rows);$i++)
       echo $rows[$i]["answer"]."<br>";
      ?>



</body>
    </html>