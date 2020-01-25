    <table border="5" cellpadding="5" cellspacing="0" style="border-  collapse: collapse" bordercolor="#808080" width="100&#3" bgcolor="#C0C0C0">
        <tr>
            <td width=100>Subject</td>
            <td width=100>Grades</td>
            <td width=100>Closing grade</td>
        </tr>

        <?php

        foreach ($this->data['subjects'] as $subjects)
        {
            echo "<tr>";
                echo "<td width=100>".$subjects['title']."</td>";
                echo "<td width=100>";
                foreach ($this->data['grades'] as $grades)
                {
                    
                    if ($grades['title'] == $subjects['title'])
                    {
                        if ($grades['closing'] != '1')
                        {
                            echo $grades['grade']." ";
                        }
                    }
                }
                echo "</td>";
                echo "<td width=100>";
                foreach ($this->data['grades'] as $grades)
                {
                    
                    if ($grades['title'] == $subjects['title'])
                    {
                        if ($grades['closing'] != '0')
                        {
                            echo $grades['grade']." ";
                        }
                    }
                }
                echo "</td>";
            echo "</tr>";
        }

        ?>

    </table>