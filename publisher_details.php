<!--
publisher details page that gives information on a certain publisher and lists all games published by them
-->

<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Game Time</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, inital-scale=1.0">
    <!--style sheets-->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
        crossorigin="anonymous">

    <style>
      .home {
          height:50px;
    }
    </style>
</head>

<body>
    <!--Nagivation bar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="#"></a>
          <img id="home" class="home" src="logo.PNG" width="auto" alt=""></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="index.php">Home</a>
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
                <a class="nav-link active" aria-current="page" href="publishers.php">Publishers</a>
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
        if (isset($_GET['publisher'])) {
            $publisher = $_GET['publisher'];
        }
    ?>

    <!--publisher details-->
    <div class="container">
        <div class="row">
            <?php   
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                die(mysqli_connect_error());
            } 
            $sql = "SELECT Name, Headquarters, About_URL
                    FROM publisher
                    WHERE Name = '$publisher'"; 
            if ($result = mysqli_query($connection, $sql)) {
                    // loop through the data 
                while($row = mysqli_fetch_assoc($result)) {
            ?>
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title"><?php echo $row['Name']?></h2>
                            <h4 class="card-title"><?php echo $row['Headquarters']?></h4>
                            <h4 class="card-title"><?php echo "<a href='{$row['About_URL']}'>{$row['About_URL']}</a><br>\n" ?></h4>
                        </div>
                    </div>
            <?php
                }
                mysqli_free_result($result); 
            }
            mysqli_close($connection); 
            ?>
        </div>
    </div>

    <!--table listing all games published by publisher-->
    <div class="container">
        <table data-toggle="table" class="sortable">
            <thead>
                <tr class="table-dark">
                    <th scope="col"></th>
                    <th data-sortable="true" scope="col">Title</th>
                    <th data-sortable="true" scope="col">Series</th>
                    <th data-sortable="true" scope="col">Developer</th>
                    <th data-sortable="true" scope="col">Publisher</th>
                    <th data-sortable="true" scope="col">Release Date</th>
                </tr>
            </thead>
            <?php 
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                echo failure;
                die(mysqli_connect_error());   
            } 
            $sql = "SELECT Id, Title, Series, Developer, Publisher, Release_Date, Image 
                    FROM game
                    where Publisher = '$publisher'"; 
            if ($result = mysqli_query($connection, $sql)) { 
                // loop through the data 
                while($row = mysqli_fetch_assoc($result)) {
            ?>
                    <th scope="row"><img src=<?php echo $row['Image'] ?> width="100"  height=auto></th>
                        <td><?php echo "<a href='game_details.php?Title={$row['Title']}&Id={$row['Id']}'>{$row['Title']}</a><br>\n" ?></td>
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
        </table>
    </div>

    <!--scripts--> 
    <script src="extensions/multiple-sort/bootstrap-table-multiple-sort.js"></script>
    <script
			  src="https://code.jquery.com/jquery-3.6.0.min.js"
			  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			  crossorigin="anonymous"></script>
    </script>
    <script src="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.js"></script>
</body>





</html>