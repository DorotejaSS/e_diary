<?php

class BaseModel
{
    public function __construct()
    {
    }

    /***
     * Metode u baznom modelu bi opciono trebale da imaju mogucnost da im se posalje ime tabele
     * Primer:
     * Imate User model klasu, dodajte njoj protected polje $table = 'users'
     * Onda bi u metodama BaseModel-a mogli jednostavno da koristite $this->table umesto da im se salje ime tabele, npr:
     * 
     * public function showAll($tbl = null)
     * {
     *      $table = $tbl ?? $this->table;
     *      ..dalje sve isto
     * 
     * Ali vam ovo ostavlja dovoljno prostora da mozete i da eksplicitno date ime tabele
     */
    public function showAll($table)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select *  from '.$table.'');
        $sql->execute();

        $results = [];
        while ($row = $sql->fetchAll()) {
            $results = $row;
        }
        return $results;
    }

     public function distinctShowAll($table)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select distinct title from '.$table.'');
        $sql->execute();

        $results = [];

        /***
         * while se pri dobavljanju podataka iz baze koristi kada zelis jedan po jedan podatak da uzmes i uradis nesto sa njim
         * U ovom slucaju while ce se izvrsiti uvek u jednoj iteraciji jer koristis fetchAll, pa samim tim i nema potrebe da se koristi while.
         * mozes jednostavno da uradis return $sql->fetchAll();
         */
        while ($row = $sql->fetchAll()) {
            $results = $row;
        }
        return $results;
    }
 
    public function getOne($table, $id)
    {        
        require('./app/db.php');

        
        /***
         * prepared statements se koriste kada zelis da zastitis bazu od sql injection-a
         * Kada koristis metodu prepare, saljes string koji ce da sluzi kao upit
         * Medjutim, na ovaj nacin nije baza sacuvana od sql-injectiona jer je poslat ceo upit i taj upit ce biti izvrsen
         * Ono sto treba da se radi je bind-ovanje parametara, primer:
         * 
         * $sql = $conn->prepare('select distinct title from :placeholder where id = :nekiId');
         * $sql->bindParam(':placeholder', $table)
         * $sql->bindParam(':nekiId', $id)
         * $sql->execute();
         * 
         * Na ovaj nacin, prvo saljes string 'select distinct title from :placeholder where id = :nekiId' u bazu i na taj nacin govoris php-u
         * Ej, evo ti ovaj upit, pripremi ga za upis i ocekuj da cu ti poslati neku vrednost koju ces smestiti u :placeholder i :nekiId
         * Nakon toga, zakacis za ta dva placeholder-a vrednosti iz varijabli kroz bindParam metodu i posaljes ih u bazu
         * Na taj nacin si sigurna da nece biti sql injection-a jer se posebno posmatra upit koji si poslala i posebno podaci koji su poslati
         * 
         * Uvek bind-uj podatke koji dolaze od korisnika (kroz forme ili url)
         */
        $sql = $conn->prepare('select * from '.$table. ' where id ='.$id.'');
        
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getByRoleId($id)
    {        
        require('./app/db.php');

        $sql = $conn->prepare('select subjects.title, users.first_name, users.last_name from subjects 
                                join users where users.role_id = 3 and users.id = '.$id.' and subjects.lecturer_id = users.id');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function getUsersByRoleId($role_id)
    {
        require('./app/db.php');

        $sql = $conn->prepare('select * from users where role_id = '.$role_id.'');
        $sql->execute();

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function usersChild($id)
    {
         require('./app/db.php');

        $sql = $conn->prepare('select * from students where parent_id = :id');
        $sql->execute(array(':id' => $id));

        $data = [];
        while ($row = $sql->fetch(PDO::FETCH_ASSOC)) {
            $data[] = $row;
        }
        return $data;
    }

    public function edit($table, $content, $id)
    {
        require('./app/db.php');
        /***
         * Na konto price iznad, pretpostavljam da ova $content varijabla sadrzi unos korisnika.
         * Korisnik bi jednostavno mogao da ugura drop table komandu u ovaj string i to bi bilo izvrseno
         * jer je deo osnovnog upita.
         * Tek kada bi se ta content varijabla bind-ovala, bili biste sigurni da sql injection nije moguc
         */
        $sql = $conn->prepare('update '.$table.' set title = "'.$content.'" where id = "'.$id.'"');
        
        $sql->execute();
    }

    public function delete($table, $id)
    {
        require('./app/db.php');
       
        /***
         * ja licno uvek u ovakvim situacijama dodajem LIMIT 1 na kraju upita, za svaki slucaj :)
         */
        $sql = $conn->prepare('delete from '.$table.' where id = ?');
        $sql->execute(array($id));
    }

    public function deleteParent($id)
    {
        require('./app/db.php');
        $sql = $conn->prepare('update students set parent_id = null where parent_id = '.$id.'');
        $sql->execute();
    }

    public function mainTeacherForClass($main_teachers_ids)
    {
        require('./app/db.php');
       
        $data = [];
        foreach ($main_teachers_ids as $main_teacher_id) {
            $sql = $conn->prepare('select id, first_name, last_name from users 
                                    where id = '.$main_teacher_id.'');
            $sql->execute();     
            while($row = $sql->fetch(PDO::FETCH_ASSOC)){
                $data[] = $row;
            }
        }
       return $data;
    }

}