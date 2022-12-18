<?php
session_start();
if (!isset($_SESSION['admin_id'])) {
    header('location:/auth/login.php');
    exit();
}
require_once '../helpers/functions.php';
$title = "Invoices";
require_once '../include/header.php';
$notice = '';
if (isset($_POST['create'])) {
    if ($con->query("insert into invoices value(NULL,  '$_POST[total_price]' , '$_POST[client_id]' )") == True) {
        $last_id = $con->insert_id;
        foreach ($_POST['form_medicines'] as $invoice_content) {
            $con->query("insert into invoices_content values (NULL, '$invoice_content[medicine_id]' ,'$invoice_content[total_price]' , $last_id )");
            $con->query("update medicines set stock='$invoice_content[stock]' where id = '$invoice_content[medicine_id]' ");
        }
        $notice = '<div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert">
  <div >
  <i class="fa fa-check-circle"></i>
    Successfully Operation
  </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>';
    } else {
        $notice = '<div class="alert alert-danger alert-dismissible fade show d-flex align-items-center" role="alert">
  <div >
  <i class="fa fa-exclamation-triangle"></i>
        Error : '. $con->error .'
  </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

</div>';
    }
}
?>
<?php echo $notice ?>
<div class="container mt-3">
    <div class="row rounded-3 bg-light py-2 mt-4">
        <h2 class="text-success text-center  "> Create Invoice </h2>
    </div>
    <div class="row mt-5">
        <div class="col-10 offset-1 offset-md-0 col-md-6 mt-2 bg-light rounded-3 pt-2">
            <table id="medicine-table" class="table text-center">
                <thead>
                <tr>
                    <th scope="col">Name Of Medicine</th>
                    <th scope="col">Number</th>
                    <th scope="col">operations</th>
                    <th scope="col">Price</th>
                    <th scope="col">Stock</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="col-2 col-md-1"></div>
        <div class="col-10  offset-1 offset-md-0 col-md-5 mt-2 bg-light rounded-3 pt-2">
            <div class="my-3">
                <label for="client" class="form-label">Select Client</label>
                <?php
                $clients = clients(500);
                if (($clients) && ($clients->num_rows > 0)) {
                    ?>
                    <select id="client" class="form-select">
                        <?php
                        while ($client = $clients->fetch_assoc()) {
                            ?>
                            <option value="<?php echo $client['id'] ?>"><?php echo $client['name'] ?></option>
                            <?php
                        }
                        ?>
                    </select>
                    <?php
                } else {
                    ?>
                    <input type="text" class="form-control" disabled value="Add client to Select">
                    <?php
                }
                ?>
            </div>
            <div class="my-3">
                <div class="row">
                    <div class="col-6">
                        <label for="medicine" class="form-label">Select Medicine</label>
                        <?php
                        $medicines = medicines(500);
                        if (($medicines) && ($medicines->num_rows > 0)) {
                            ?>
                            <select id="medicine" class="form-select">
                                <?php
                                while ($medicine = $medicines->fetch_assoc()) {
                                    ?>
                                    <option data-price="<?php echo $medicine['price'] ?>"
                                            data-stock="<?php echo $medicine['stock'] ?>"
                                            value="<?php echo $medicine['id'] ?>"><?php echo $medicine['name'] ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                            <?php
                        } else {
                            ?>
                            <input type="text" class="form-control" disabled value="Add Medicine to Select">
                            <?php
                        }
                        ?>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <label for="number-of-selected-medicine" class="form-label">Number</label>
                            <input type="number" class="form-control" id="number-of-selected-medicine" value="1">
                        </div>
                    </div>
                    <div class="col-3">
                        <div><label class="form-label">Price : <span id="show-price">  </span></label></div>
                        <div><label class="form-label">Stock : <span id="show-stock">  </span></label></div>

                    </div>
                </div>

            </div>

            <div class="row">
                <button id="add-medicine" class="btn btn-success"> ADD</button>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-10 offset-1">
            <button id="create-invoice" class="btn btn-success w-100"> Create</button>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#show-price").text($('#medicine').find(":selected").data("price"));
        $("#show-stock").text($('#medicine').find(":selected").data("stock"));
        $('#medicine').change(function () {
            $("#show-price").text($(this).find(":selected").data("price"));
            $("#show-stock").text($(this).find(":selected").data("stock"));
        })
        $("#add-medicine").click(function () {
            let selected = $('#medicine').find(":selected");
            let number = parseInt($("#number-of-selected-medicine").val());
            if (isNaN(number)) number = 1;
            let price = parseFloat(selected.data("price"));
            if (isNaN(price)) price = 1.0;
            let stock = parseInt(selected.data("stock"))
            if (isNaN(stock)) stock = 0;
            let nameOfMedicine = selected.text();
            let medicineId = selected.val();
            if (stock === 0) return;
            selected.remove();
            $("#medicine-table > tbody:last-child").append(`
                <tr class="selected-medicines" data-price-per-unit="${price}" data-m-id="${medicineId}" id="${nameOfMedicine.trim()}-${medicineId.trim()}">
                        <td class="name-of-medicine"> ${nameOfMedicine} </td>
                        <td class="number-of-medicine"> ${number} </td>
                        <td style="cursor: pointer">   <span class="mx-2 text-white"><span class="bg-danger py-1 px-2" onclick="updateMedicine( '${nameOfMedicine.trim()}-${medicineId.trim()}', 'sub')">-</span><span class="bg-success py-1 px-2" onclick="updateMedicine( '${nameOfMedicine.trim()}-${medicineId.trim()}', 'add')">+</span></span><span class="text-danger" onclick="deleteMedicine('${nameOfMedicine.trim()}-${medicineId.trim()}')"><i class="fa fa-trash"></i></span>  </td>
                        <td class="price"> ${number * price}</td>
                        <td class="stock"> ${stock - number} </td>
                </tr>
            `);

        })

        $('#create-invoice').click(function () {
            if ($(".selected-medicines").length == 0) return;
            let total = 0;
            $("#hidden-form").append(`<input type="hidden"  name="client_id" value="${$('#client').find(":selected").val()}">`)
            $(".selected-medicines").each(function (index, medicine) {
                medicine = $(medicine);
                let price = parseFloat($(`#${medicine.attr("id")} > .price:first`).text().trim());
                total += price;
                $("#hidden-form").append(`<input type="hidden"  name="form_medicines[${index}][medicine_id]" value="${medicine.data("m-id")}">`)
                $("#hidden-form").append(`<input type="hidden"  name="form_medicines[${index}][total_price]" value="${price}">`)
                $("#hidden-form").append(`<input type="hidden"  name="form_medicines[${index}][stock]" value="${parseFloat($(`#${medicine.attr("id")} > .stock:first`).text().trim())}">`)

            }).get();
            $("#hidden-form").append(`<input type="hidden"  name="total_price" value="${total}">`)

            $("#hidden-form").submit()
        });
    })

    function deleteMedicine(id) {
        let element = $(`#${id}`);
        let nameOfMedicine = $(`#${id} > .name-of-medicine:first`).text();
        let stock = parseInt($(`#${id} > .stock:first`).text().trim());
        let number = parseInt($(`#${id} > .number-of-medicine:first`).text().trim());

        $('#medicine').append(`
            <option data-price="${element.data('price-per-unit')}" data-stock="${number + stock}" value="${element.data('m-id')}">${nameOfMedicine}</option>
        `);
        element.remove();
    }

    function updateMedicine(id, operation) {
        let stock = parseInt($(`#${id} > .stock:first`).text().trim());
        let number = parseInt($(`#${id} > .number-of-medicine:first`).text().trim());
        if ((operation == 'add') && (stock > 0)) {
            $(`#${id} > .stock:first`).text(stock - 1)
            $(`#${id} > .number-of-medicine:first`).text(number + 1)
            $(`#${id} > .price:first`).text((number + 1) * parseFloat($(`#${id}`).data('price-per-unit')))
        } else if ((operation == "sub") && (number > 0)) {
            $(`#${id} > .stock:first`).text(stock + 1)
            $(`#${id} > .number-of-medicine:first`).text(number - 1)
            $(`#${id} > .price:first`).text((number + 1) * parseFloat($(`#${id}`).data('price-per-unit')))
        }
    }


</script>
<form id="hidden-form" method="post">
    <input type="hidden" id="create-form" name="create">
</form>
<?php require_once '../include/footer.php' ?>


