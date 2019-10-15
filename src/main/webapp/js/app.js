$(document).ready(function () {
    $("#collection-table").DataTable({
        "ordering": true,
        "searching": true,
        "columnDefs": [
            {
                "targets": 3,
                "sorting": false
            },
            {
                "targets": 4,
                "sorting": false
            },
            {
                "targets": 5,
                "sorting": false
            }
        ]
    });
});

$(document).ready(function () {
    $(".my-table").DataTable({
        "ordering": true,
        "searching": true
    });
});