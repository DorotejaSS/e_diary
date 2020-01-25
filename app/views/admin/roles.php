</br></br></br>
<h3>Roles</h3>
    <table id="myTable">
        <tr>
            <th>ID:</th> 
            <th>Role Name:</th>
            <th>Edit:</th>
            <th>Remove:</th>
        </tr>

        <?php foreach ($this->data as $index => $innerarray) : ?>
            <?php $id = $innerarray['id']; ?>

            <tr>
                <td><?= $id; ?></td>
                <td><a href="/rolepermissions/<?= $id; ?>/edit"><?= $innerarray['title'] ?></a></td>
                <td><a class="btn btn-primary" href="/roles/<?= $id; ?>/edit">Edit</a></td>
                <td><a class="btn btn-danger" href="/roles/<?= $id; ?>/delete">Delete</a></td>
            </tr>            

        <?php endforeach; ?>

    </table>