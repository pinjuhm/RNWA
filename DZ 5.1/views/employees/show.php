<div class="container">
    <h3>Here is a full details of the employee <?php $employee->firstName ?></h3>
    <p>
        Full name: <?php echo $employee->firstName . ' ' . $employee->lastName; ?>
    </p>
    <p>
        Birth date: <?php echo $employee->birthDate; ?>
    </p>
    <p>
        Gender: <?php echo $employee->sex; ?>
    </p>
    <p>
        Hire date: <?php echo $employee->date_of_join; ?>
    </p>
    <p>
        Contact: <?php echo $employee->contact_no; ?>
    </p>
	<p>
        Department <?php echo $employee->dep_name; ?>
    </p>
</div>