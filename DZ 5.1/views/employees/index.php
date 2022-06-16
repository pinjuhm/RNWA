<div class="container list-container">
  <h3>Here is a list of all employees:</h3>

  <div class="list">
    <?php foreach($employees as $employee): ?>
      <p class="list-item">
        <?php echo $employee->firstName . ' ' . $employee->lastName; ?>
        <a href='?controller=employees&action=show&id=<?php echo $employee->id; ?>'>
          Show details
        </a>
      </p>
    <?php endforeach; ?>
  </div>
</div>