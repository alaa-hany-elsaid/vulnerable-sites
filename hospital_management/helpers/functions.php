<?php


function execute_query($query)
{
    global $db_connection;
    return mysqli_query($db_connection, $query);
}


function get_result($query)
{

    return mysqli_fetch_all(execute_query($query), MYSQLI_ASSOC);
}


function get_row_by($table, $by, $value)
{
    $query = "SELECT * FROM " . $table . " WHERE $by= $value ";
    return get_result($query)[0];
}


function get_all_out_patients()
{
    return get_result("SELECT * FROM out_patient , doctors , departments  WHERE (out_patient.doctor_id = doctors.doctor_id ) AND (out_patient.department_id = departments.department_id)");
}

function get_out_patients_by_doctor_id($doctor_id)
{
    return get_result("SELECT * FROM out_patient , doctors , departments  WHERE (in_patient.doctor_id = $doctor_id ) AND (out_patient.doctor_id = doctors.doctor_id ) AND (out_patient.department_id = departments.department_id)");
}


function get_all_in_patients()
{

    return get_result("SELECT in_patient.* , doctors.* ,  departments.* , nurses.nurse_name  FROM in_patient , doctors , departments , nurses  WHERE  (in_patient.doctor_id = doctors.doctor_id ) AND (in_patient.department_id = departments.department_id) AND (in_patient.nurse_id = nurses.nurse_id)");

}

function get_in_patients_by_doctor_id($doctor_id)
{

    return get_result("SELECT in_patient.* , doctors.* ,  departments.* , nurses.nurse_name  FROM in_patient , doctors , departments , nurses  WHERE (in_patient.doctor_id = $doctor_id ) AND (in_patient.doctor_id = doctors.doctor_id ) AND (in_patient.department_id = departments.department_id) AND (in_patient.nurse_id = nurses.nurse_id)");

}


function get_all_doctors()
{
    return get_result("SELECT * FROM doctors");
}


function update_doctor($id, $attres)
{
    if (!is_array($attres)) {
        return false;
    }
    $query = "UPDATE doctors SET ";
    foreach ($attres as $key => $value) {
        $query .= $key . "='" . $value . "',";
    }
    $query = rtrim($query, ',') . " WHERE doctor_id=" . $id;
    if (!execute_query($query)) {
        var_dump(mysqli_connect_error());
        echo $query . "\n";
    }
    return true;
}


function get_doctor_by_id($id)
{
    return get_row_by("doctors", "doctor_id", $id);
}

function get_doctor_by_email($email)
{
    return get_row_by("doctors", "Email", "'" . $email . "'");
}

function get_all_nurses()
{
    return get_result("SELECT * FROM nurses");
}


