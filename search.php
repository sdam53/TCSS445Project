<!--
search page that gives search resutls for games, developers, publishers, and users based on search input
-->

<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>     
    <!--style sheets-->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.19.1/dist/bootstrap-table.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
        crossorigin="anonymous">

    <title>Game Time</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, inital-scale=1.0">
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
                    WHERE Title LIKE '%$Search%'"; 
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

  <!--table listing all developer search results-->
    <div class="container">
        <table data-toggle="table" class="sortable">
            <thead>
                <tr class="table-dark">
                    <th data-sortable="true" scope="col">Developer</th>
                    <th data-sortable="true" scope="col">Headquarters</th>
                    <th scope="col">About</th>
                </tr>
            </thead>
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
        </table>
    </div>

  <!--table listing all publisher search results-->
    <div class="container">
        <table data-toggle="table" class="sortable">
            <thead>
                <tr class="table-dark">
                    <th data-sortable="true" scope="col">Publisher</th>
                    <th data-sortable="true" scope="col">Headquarters</th>
                    <th scope="col">About</th>
                </tr>
            </thead>
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
        </table>
    </div>

    <!--table listing all user search results-->
    <div class="container">
        <table data-toggle="table" class="sortable">
            <thead>
                <tr class="table-dark">
                    <th data-sortable="true" scope="col">User Name</th>
                    <th data-sortable="true" scope="col">Verified</th>
                    <th data-sortable="true" scope="col">Rating</th>
                </tr>
            </thead>
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