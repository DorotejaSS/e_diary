</br></br></br>
    <h3>Permissions</h3>
        <table id="myTable">
            <tr>
                <th>ID:</th> 
                <th>Permission Name:</th>
                <th>Edit:</th>
                <th>Delete:</th>
            </tr>

                    <?php foreach ($this->data as $key => $value) : ?>
                        <?php $id = $value['id']; ?>
                        <tr>
                            <td><?= $id; ?></td>
                            <td><?= $value['title']; ?></td>
                            <td><a class="btn btn-primary" href="/permissions/<?= $id; ?>/edit">Edit</a></td>
                            <td><a class="btn btn-danger" href="/permissions/<?= $id; ?>/delete">Delete</a></td>
                        </tr>
            
                    <?php endforeach; ?>

        </table>