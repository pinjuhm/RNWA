<div class="container list-container">
  <h3>Here is a list of all employee deparments:</h3>

  <div class="list">
    <?php foreach($employee_department as $employee_department): ?>
      <p class="list-item">
        <?php echo $employee_department->name ?>
        <a href='?controller=employee_departments&action=show&id=<?php echo $employee_department->id; ?>'>
          Show details
        </a>
      </p>
    <?php endforeach; ?>
  </div>
</div>