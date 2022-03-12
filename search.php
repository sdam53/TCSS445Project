<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
  </style>


  
    <script
      src="https://code.jquery.com/jquery-3.6.0.js"
      integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
      crossorigin="anonymous"></script>
      
      <script
      src="//cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
   

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


  <title>Game Time</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, inital-scale=1.0">
</head>

<body>
  <!--Nagivation bar-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">GameTime</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="games.php">Games</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="users.php">Users</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="developers.php">Developers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="publishers.php">Publishers</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reviews.php">Reviews</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.php">About</a>
          </li>
        </ul>
        <form class="d-flex" form method="get" action="search.php">>
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit" >Search</button>
        </form>
      </div>
    </div>
  </nav>

  
  <?php
    if (isset($_GET['search'])) {
        $Search = $_GET['search'];
    }
  ?>

  <!--table listing all video games search results-->
  <div class="container">
        <table id="list" class="table table-bordered"  >
            <thead>
                <tr class="table-dark">
                    <th scope="col"></th>
                    <th scope="col">Title</th>
                    <th scope="col">Series</th>
                    <th scope="col">Developer</th>
                    <th scope="col">Publisher</th>
                    <th scope="col">Release Date</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT Id, Title, Series, Developer, Publisher, Release_Date, Image 
                        FROM game
                        WHERE Title LIKE '%$Search%'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><img src=<?php echo $row['Image'] ?> width="100"  height=auto></th>
                            <td><?php echo "<a href='game_details.php?Id={$row['Id']}'>{$row['Title']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='series_details.php?series={$row['Series']}'>{$row['Series']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='developer_details.php?developer={$row['Developer']}'>{$row['Developer']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='publisher_details.php?publisher={$row['Publisher']}'>{$row['Publisher']}</a><br>\n" ?></td>
                            <td><?php echo $row['Release_Date'] ?></td>
                        </tr>
                <?php 
                    } 
                    // release the memory used by the result set 
                    mysqli_free_result($result);  
                }  
                // close the database connection 
                mysqli_close($connection); 
                ?> 
            </thead>
        </table>
    </div>

  <!--table listing all developer search results-->
  <!--table listing all developers-->
  <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">Developer</th>
                    <th scope="col">Headquarters</th>
                    <th scope="col">About</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT Name, Headquarters, About_URL
                        FROM developer
                        WHERE Name LIKE '%$Search%'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><?php echo "<a href='developer_details.php?developer={$row['Name']}'>{$row['Name']}</a><br>\n" ?></th>
                            <td><?php echo $row['Headquarters']?></td>
                            <td><?php echo "<a href='{$row['About_URL']}'>{$row['About_URL']}</a><br>\n" ?></td>
                        </tr>
                <?php 
                    } 
                    // release the memory used by the result set 
                    mysqli_free_result($result);  
                }  
                // close the database connection 
                mysqli_close($connection); 
                ?> 
            </thead>
        </table>
    </div>

  <!--table listing all publisher search results-->
  <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">Publisher</th>
                    <th scope="col">Headquarters</th>
                    <th scope="col">About</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT Name, Headquarters, About_URL
                        FROM publisher
                        WHERE Name LIKE '%$Search%'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><?php echo "<a href='publisher_details.php?publisher={$row['Name']}'>{$row['Name']}</a><br>\n" ?></th>
                            <td><?php echo $row['Headquarters']?></td>
                            <td><?php echo "<a href='{$row['About_URL']}'>{$row['About_URL']}</a><br>\n" ?></td>
                        </tr>
                <?php 
                    } 
                    // release the memory used by the result set 
                    mysqli_free_result($result);  
                }  
                // close the database connection 
                mysqli_close($connection); 
                ?> 
            </thead>
        </table>
    </div>

  <!--table listing all user search results-->
  <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">User Name</th>
                    <th scope="col">Verified</th>
                    <th scope="col">Rating</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT Id, user.Name_Display, Is_Verified, User_Rating
                        FROM user
                        WHERE Name_Display LIKE '%$Search%'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><?php echo "<a href='user_details.php?Id={$row['Id']}'>{$row['Name_Display']}</a><br>\n" ?></th>
                            <td><?php echo $row['Is_Verified']?></td>
                            <td><?php echo $row['User_Rating'] ?></td>
                        </tr>
                <?php 
                    } 
                    // release the memory used by the result set 
                    mysqli_free_result($result);  
                }  
                // close the database connection 
                mysqli_close($connection); 
                ?> 
            </thead>
        </table>
    </div>





      
  
</body>

</html>