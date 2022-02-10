<?php

/**
 * Use an HTML form to edit an entry in the
 * people table.
 *
 */

require "config.php";
require "common.php";
if (isset($_POST['submit'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $user =[
      "idPeople"        => $_POST['idPeople'],
      "firstname" => $_POST['firstname'],
      "lastname"  => $_POST['lastname'],
      "address"  => $_POST['address'],
      "city"  => $_POST['city'],
      "state"  => $_POST['state'],
      "zip"  => $_POST['zip'],
      "email"     => $_POST['email'],
      "age"       => $_POST['age'],
      "date"      => $_POST['date']
    ];

    $sql = "UPDATE people 
            SET idPeople = :idPeople, 
              firstname = :firstname, 
              lastname = :lastname, 
              address = :address,
              city = :city,
              state = :state,
              zip = zip,
              email = :email, 
              age = :age, 
              date = :date 
            WHERE idPeople = :idPeople";
  
  $statement = $connection->prepare($sql);
  $statement->execute($user);
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();
  }
}

if (isset($_GET['idPeople'])) {
  try {
    $connection = new PDO($dsn, $username, $password, $options);
    $idPeople = $_GET['idPeople'];

    $sql = "SELECT * FROM people WHERE idPeople = :idPeople";
    $statement = $connection->prepare($sql);
    $statement->bindValue(':idPeople', $idPeople);
    $statement->execute();

    $user = $statement->fetch(PDO::FETCH_ASSOC);
  } catch(PDOException $error) {
      echo $sql . "<br>" . $error->getMessage();    
  }
} else {
    echo "Something went wrong!";
    exit;
}
?>
<?php require "templates/header.php"; ?>
<h2>Edit a user</h2>

<form method="post">
    <?php foreach ($user as $key => $value) : ?>
      <label for="<?php echo $key; ?>"><?php echo ucfirst($key); ?></label>
        <input type="text" name="<?php echo $key; ?>" id="<?php echo $key; ?>" value="<?php echo escape($value); ?>" <?php echo ($key === 'id' ? 'readonly' : null); ?>>
    <?php endforeach; ?> 
    <input type="submit" name="submit" value="Submit">
</form>
<a href="index.php">Back to home</a>
<?php require "templates/footer.php"; ?>