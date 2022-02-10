<?php

/**
 * List all users with a link to edit
 */

try {
  require "config.php";
  require "common.php";
  if (isset($_GET["idPeople"])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
  
    $idPeople = $_GET["idPeople"];

    $sql = "DELETE FROM people WHERE idPeople = :idPeople";

    $statement = $connection->prepare($sql);
    $statement->bindValue(':idPeople', $idPeople);
    $statement->execute();

    $success = "User successfully deleted";
  } catch(PDOException $error) {
    echo $sql . "<br>" . $error->getMessage();
  }
}

  $connection = new PDO($dsn, $username, $password, $options);

  $sql = "SELECT * FROM people";

  $statement = $connection->prepare($sql);
  $statement->execute();

  $result = $statement->fetchAll();

} catch(PDOException $error) {
  echo $sql . "<br>" . $error->getMessage();
}
?>
<?php include "templates/header.php"; ?>
<h2>Update Users</h2>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>First Name</th>
      <th>Last Name</th>
       <th>Address</th>
       <th>City</th>
       <th>State</th>
       <th>Zip</th>
      <th>Email Address</th>
      <th>Age</th>
      <th>Date</th>
	  <th>Delete</th>
    </tr>
  </thead>
  <tbody>
  <?php foreach ($result as $row) : ?>
    <tr>
      <td><?php echo escape($row["idPeople"]); ?></td>
      <td><?php echo escape($row["firstname"]); ?></td>
      <td><?php echo escape($row["lastname"]); ?></td>
      <td><?php echo escape($row["address"]); ?></td>
      <td><?php echo escape($row["city"]); ?></td>
      <td><?php echo escape($row["state"]); ?></td>
      <td><?php echo escape($row["zip"]); ?></td>
      <td><?php echo escape($row["email"]); ?></td>
      <td><?php echo escape($row["age"]); ?></td>
      <td><?php echo escape($row["date"]); ?> </td>
	 <td><a href="delete.php?idPeople=<?php echo escape($row["idPeople"]); ?>">Delete</a></td>
  </tr>
  <?php endforeach; ?>
  </tbody>
</table>
<a href="index.php">Back to home</a>
<?php require "templates/footer.php"; ?>