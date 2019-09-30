<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Test</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../../css/dataTables.bootstrap4.min.css">
    <%@ include file="dependencies.jsp" %>
</head>
<body>
<h1>To jest test dla tabelek hihi</h1>
<div id="table-section" class="mt-5">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <table class="table">
                <thead>
                <tr>
                    <th>Id Number</th>
                    <th>Name</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>123456</td>
                    <td>Some name</td>
                </tr>
                <tr>
                    <td>233456</td>
                    <td>Some nameX</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<%@ include file="scripts.jsp" %>
<%@ include file="footer.jsp" %>
<script
        src="http://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">

</script>
<script type="text/javascript" src="../../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".table").DataTable({
            "ordering": true
        });
    });
</script>
<script>
    function showDiv(data) {
        $("#ele-" + data).addClass('make-visible');
        hideElement(3, data);
    }

    function hideElement(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#ele-" + i).removeClass('make-visible');
            }
        }
    }

    function paintYellow(data) {
        $("#option-item-" + data).addClass('paint-yellow');
        unpaintYellow(3, data);
    }

    function unpaintYellow(total, active) {
        for (let i = 1; i <= total; i++) {
            if (i != active) {
                $("#option-item-" + i).removeClass('paint-yellow');
            }
        }
    }
</script>
</body>
</html>