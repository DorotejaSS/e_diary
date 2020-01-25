
<table id="myTable">
    <tr>
        <th>Subject</th>
        <th>Grade</th>
        <th>Created At</th>
        <th>Semestar</th>
        <th>Closing</th>
    </tr>
    <?php foreach ($this->data as $key => $value) : ?>
        <tr>
            <td><?= $value['title']; ?></td>
            <td><?= $value['grade']; ?></td>
            <td><?= $value['created_at']; ?></td>
            <td><?= $value['semestar']; ?></td>
            <td><?= $value['closing']; ?></td>
        </tr>
    <?php endforeach; ?>