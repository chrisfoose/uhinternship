<?php

/**
 * Function to query information based on 
 * a parameter: in this case, Last Name.
 *
 */

if (isset($_POST['submit'])) {
    try {    
        require "config.php";
        require "common.php";

        $connection = new PDO($dsn, $username, $password, $options);

        $sql = "SELECT * 
                        FROM people
                        WHERE lastname = :lastname";

        $lastname = $_POST['lastname'];

        $statement = $connection->prepare($sql);
        $statement->bindParam(':lastname', $lastname, PDO::PARAM_STR);
        $statement->execute();

        $result = $statement->fetchAll();
    } catch(PDOException $error) {
        echo $sql . "<br>" . $error->getMessage();
    }
}
?>
<?php include "templates/header.php"; ?>
<?php  
if (isset($_POST['submit'])) {
    if ($result && $statement->rowCount() > 0) { ?>
        <h2>Results</h2>

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
                </tr>
            </thead>
            <tbody>
    <?php foreach ($result as $row) { ?>
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
            </tr>
        <?php } ?> 
            </tbody>
    </table>
    <?php } else { ?>
        <blockquote>No results found for <?php echo escape($_POST['lastname']); ?>.</blockquote>
    <?php } 
} ?> 
<h2>Find user based on Last Name</h2>
<form method="post">

<label for="lastname">Last Name</label>

<input type="text" name="lastname" id="lastname">

<input type="submit" name="submit" value="Submit">

</form>
<a href="index.php">Back to home</a>
<?php include "templates/footer.php"; ?>

