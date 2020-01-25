    <?php

    foreach ($this->data as $data)
    {
        echo '<a href="/parents/' . $data['id'] . '">' . $data['first_name'] . ' ' . $data['last_name'] . '</a> <br>';
    }
    
    ?>