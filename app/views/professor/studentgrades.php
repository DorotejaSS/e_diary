
<table id="myTable">
    <tr>
        <th>Grade</th>
        <th>Created At</th>
        <th>Semestar</th>
        <th>Closing</th>
    </tr>
    <?php foreach ($this->data['grades'] as $key => $value) : ?>
        <tr>
            <td><?= $value['grade']; ?></td>
            <td><?= $value['created_at']; ?></td>
            <td><?= $value['semestar']; ?></td>
            <td><?= $value['closing']; ?></td>
        </tr>
    <?php endforeach; ?>